(define (domain depots)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        place - object
        depot distributor - place
        surface - object
        crate pallet - surface
        truck hoist - object
    )

    (:predicates
        (at ?obj - (either truck hoist crate pallet) ?loc - place) ; Corrected syntax for type disjunction
        (on ?c - crate ?s - surface)
        (clear ?s - surface)
        (in ?c - crate ?t - truck)
        (lifting ?h - hoist ?c - crate)
        (available ?h - hoist)
    )

    (:action drive
        :parameters (?t - truck ?from ?to - place)
        :precondition (and
            (at ?t ?from)
            (not (at ?t ?to)) ; Ensures truck is not already at destination
        )
        :effect (and
            (not (at ?t ?from))
            (at ?t ?to)
        )
    )

    (:action lift
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?c ?p)
            (at ?s ?p) ; The surface the crate is on must also be at the place
            (available ?h)
            (clear ?c) ; The crate itself must be clear (nothing on top of it)
            (on ?c ?s) ; The crate must be on a surface
        )
        :effect (and
            (not (at ?c ?p)) ; Crate is no longer at the place (it's being lifted)
            (lifting ?h ?c)
            (not (available ?h))
            (clear ?s) ; The surface the crate was on becomes clear
            (not (on ?c ?s)) ; Crate is no longer on the surface
        )
    )

    (:action drop
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?s ?p)
            (clear ?s) ; The surface to drop onto must be clear
            (lifting ?h ?c)
        )
        :effect (and
            (available ?h)
            (not (lifting ?h ?c))
            (at ?c ?p) ; Crate is now at the place
            (not (clear ?s)) ; The surface it was dropped onto is no longer clear
            (clear ?c) ; Crate itself becomes clear after being dropped (nothing on it initially)
            (on ?c ?s)
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
            (available ?h)
            (not (lifting ?h ?c))
            (in ?c ?t) ; Crate is now in the truck
            ; The problem statement for LOAD effects was incomplete, inferred from UNLOAD.
            ; No need to change 'at' for crate because it's 'lifting' and not 'at' place
            ; Effects are consistent with hoist becoming available and crate no longer lifted
        )
    )

    (:action unload
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?t ?p)
            (available ?h) ; Hoist must be available to perform unloading
            (in ?c ?t)
        )
        :effect (and
            (not (in ?c ?t))
            (not (available ?h))
            (lifting ?h ?c) ; Hoist is now lifting the crate
            ; Crate is not yet 'at' the place; it's being lifted by the hoist.
        )
    )
)