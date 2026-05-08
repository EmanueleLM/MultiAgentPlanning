(define (domain depots)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        object
        place - object
        depot distributor - place
        locatable - object ; New supertype for all objects that can be at a place
        hoist - locatable
        truck - locatable
        surface - locatable
        pallet crate - surface
    )
    (:predicates
        (at ?obj - locatable ?loc - place) ; Changed to use locatable supertype
        (on ?c - crate ?s - surface)
        (clear ?s - surface)
        (available ?h - hoist)
        (lifting ?h - hoist ?c - crate)
        (in ?c - crate ?t - truck)
        (connected ?p1 - place ?p2 - place)
    )

    (:action drive_truck
        :parameters (?t - truck ?from - place ?to - place)
        :precondition (and
            (at ?t ?from)
            (connected ?from ?to)
        )
        :effect (and
            (not (at ?t ?from))
            (at ?t ?to)
        )
    )

    (:action lift_crate
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?c ?p)
            (on ?c ?s)
            (available ?h)
            (clear ?c) ; The crate itself must be clear to be lifted
        )
        :effect (and
            (not (at ?c ?p)) ; Crate is no longer 'at' the place when lifted
            (lifting ?h ?c)
            (not (available ?h))
            (clear ?s) ; The surface the crate was on becomes clear
            (not (on ?c ?s))
        )
    )

    (:action drop_crate
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?s ?p)
            (clear ?s) ; The target surface must be clear
            (lifting ?h ?c)
        )
        :effect (and
            (available ?h)
            (not (lifting ?h ?c))
            (at ?c ?p) ; Crate is now at the place, after being dropped
            (not (clear ?s))
            (clear ?c) ; Crate itself becomes clear (it's on top of the new stack)
            (on ?c ?s)
        )
    )

    (:action load_crate_into_truck
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
        )
    )

    (:action unload_crate_from_truck
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?t ?p)
            (available ?h) ; Hoist must be available to unload
            (in ?c ?t)
        )
        :effect (and
            (not (in ?c ?t))
            (not (available ?h))
            (lifting ?h ?c)
        )
    )
)