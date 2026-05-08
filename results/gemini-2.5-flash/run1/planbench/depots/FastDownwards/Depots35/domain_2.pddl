(define (domain depots35)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        place
        depot distributor - place
        surface
        pallet crate - surface
        truck
        hoist
    )
    (:predicates
        (at ?obj - (either truck hoist crate pallet) ?loc - place)
        (lifting ?h - hoist ?c - crate)
        (available ?h - hoist)
        (clear ?s - surface)
        (on ?c - crate ?s - surface)
        (in ?c - crate ?t - truck)
    )

    (:action drive
        :parameters (?t - truck ?from - place ?to - place)
        :precondition (at ?t ?from)
        :effect (and
            (not (at ?t ?from))
            (at ?t ?to)
        )
    )

    (:action lift
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
            (at ?h ?p)
            (available ?h)
            (at ?c ?p)
            (on ?c ?s)
            (clear ?c) ; The top of the crate must be clear to be lifted
            (at ?s ?p) ; The surface must be at the same place
        )
        :effect (and
            (not (at ?c ?p)) ; Crate is no longer at the place once lifted
            (not (on ?c ?s))
            (clear ?s) ; The surface it was on becomes clear
            (lifting ?h ?c)
            (not (available ?h))
            (not (clear ?c)) ; The lifted crate is no longer clear on top
        )
    )

    (:action drop
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?s ?p)
            (clear ?s) ; Surface to drop on must be clear
            (lifting ?h ?c)
        )
        :effect (and
            (not (lifting ?h ?c))
            (available ?h)
            (at ?c ?p) ; Crate is now at the place
            (on ?c ?s)
            (not (clear ?s)) ; Surface is no longer clear
            (clear ?c) ; Crate itself is clear on top after being dropped
        )
    )

    (:action load
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?t ?p)
            (lifting ?h ?c)
        )
        :effect (and
            (not (lifting ?h ?c))
            (available ?h)
            (in ?c ?t)
            (not (clear ?c)) ; Crate inside a truck is not clear on top
        )
    )

    (:action unload
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?t ?p)
            (available ?h) ; Hoist must be available to perform unload
            (in ?c ?t)
        )
        :effect (and
            (not (in ?c ?t))
            (not (available ?h))
            (lifting ?h ?c)
            (not (at ?c ?p)) ; Crate is now lifted, so not at a place
            (not (clear ?c)) ; Unloaded and lifted crate is not clear on top
        )
    )