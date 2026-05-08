(define (domain depots7)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        place surface - object
        depot distributor - place
        pallet crate - surface
        truck hoist - object
    )
    (:predicates
        (at ?obj - (either truck hoist crate pallet) ?loc - place)
        (available ?h - hoist)
        (clear ?s - surface)
        (on ?c - crate ?s - surface)
        (lifting ?h - hoist ?c - crate)
        (in ?c - crate ?t - truck)
    )

    (:action drive_truck
        :parameters (?t - truck ?from ?to - place)
        :precondition (and
            (at ?t ?from)
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
            (at ?s ?p) ; Added for consistency: surface must also be at the place
            (available ?h)
            (clear ?c)
            (on ?c ?s)
        )
        :effect (and
            (not (at ?c ?p))
            (lifting ?h ?c)
            (not (available ?h))
            (clear ?s)
            (not (on ?c ?s))
            (not (clear ?c)) ; Explicitly make crate not clear when lifted
        )
    )

    (:action drop_crate
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?s ?p)
            (clear ?s)
            (lifting ?h ?c)
        )
        :effect (and
            (available ?h)
            (not (lifting ?h ?c))
            (at ?c ?p)
            (not (clear ?s))
            (clear ?c) ; Crate is clear once dropped
            (on ?c ?s)
        )
    )

    (:action load_crate
        :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?tr ?p)
            (lifting ?h ?c)
        )
        :effect (and
            (available ?h)
            (not (lifting ?h ?c))
            (in ?c ?tr)
            (not (at ?c ?p))
            (not (clear ?c)) ; Crate is not clear when loaded into a truck
        )
    )

    (:action unload_crate
        :parameters (?h - hoist ?c - crate ?tr - truck ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?tr ?p)
            (available ?h)
            (in ?c ?tr)
        )
        :effect (and
            (not (in ?c ?tr))
            (not (available ?h))
            (lifting ?h ?c)
            (not (clear ?c)) ; Crate is not clear when lifted from a truck
        )
    )