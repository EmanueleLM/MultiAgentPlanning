(define (domain depots16)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        place - object
        depot distributor - place
        surface - object
        pallet crate - surface
        truck hoist - object
    )

    (:predicates
        (at ?obj - object ?place - place) ; Location for trucks, hoists, pallets, and crates (when on a surface)
        (on ?c - crate ?s - surface) ; Stacking relationship: ?c is on ?s
        (clear ?s - surface) ; True if nothing is on top of surface ?s
        (available ?h - hoist) ; True if hoist ?h is not busy
        (lifting ?h - hoist ?c - crate) ; True if hoist ?h is currently lifting crate ?c
        (in ?c - crate ?t - truck) ; True if crate ?c is inside truck ?t
    )

    (:action drive
        :parameters (?truck - truck ?from - place ?to - place)
        :precondition (and
            (at ?truck ?from)
            (not (= ?from ?to)) ; Must move to a different place
        )
        :effect (and
            (not (at ?truck ?from))
            (at ?truck ?to)
        )
    )

    (:action lift
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?c ?p) ; Crate must be at the same place as hoist
            (available ?h)
            (clear ?c) ; Crate itself must be clear to be lifted
            (on ?c ?s) ; Crate must be on a surface to be lifted from it
        )
        :effect (and
            (not (at ?c ?p)) ; Crate is no longer "at" the place (it's being lifted)
            (not (available ?h))
            (lifting ?h ?c)
            (clear ?s) ; The surface it was on becomes clear
            (not (on ?c ?s))
            ; Removed: (not (clear ?c)) - A lifted crate is still clear on its top.
        )
    )

    (:action drop
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?s ?p) ; Destination surface must be at the same place
            (clear ?s) ; Destination surface must be clear (nothing on it)
            (lifting ?h ?c)
        )
        :effect (and
            (available ?h)
            (not (lifting ?h ?c))
            (at ?c ?p) ; Crate is now "at" the place (on a surface)
            (not (clear ?s)) ; Surface is no longer clear
            (clear ?c) ; Crate is now clear on top (nothing on it), per human spec
            (on ?c ?s)
        )
    )

    (:action load
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?t ?p)
            (lifting ?h ?c) ; Hoist must be lifting the crate
        )
        :effect (and
            (not (lifting ?h ?c))
            (available ?h)
            (in ?c ?t) ; Crate is now inside the truck
        )
    )

    (:action unload
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?t ?p)
            (available ?h) ; Hoist must be available to pick up from truck
            (in ?c ?t)
        )
        :effect (and
            (not (in ?c ?t))
            (not (available ?h))
            (lifting ?h ?c) ; Hoist is now lifting the crate
        )
    )