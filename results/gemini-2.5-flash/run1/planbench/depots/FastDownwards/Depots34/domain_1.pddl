(define (domain depots34)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        depot distributor - place
        pallet crate - surface
        place surface - object
        truck hoist - object
    )

    (:predicates
        (at ?obj - (or truck hoist pallet crate) ?loc - place)
        (on ?c - crate ?s - surface)
        (clear ?s - surface)
        (in ?c - crate ?t - truck)
        (lifting ?h - hoist ?c - crate)
        (available ?h - hoist)
        (road ?from ?to - place)
    )

    (:action drive_truck
        :parameters (?t - truck ?from ?to - place)
        :precondition (and
            (at ?t ?from)
            (road ?from ?to)
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
            (on ?c ?s)
            (at ?s ?p)
            (available ?h)
            (clear ?c)
        )
        :effect (and
            (not (at ?c ?p))
            (lifting ?h ?c)
            (not (available ?h))
            (clear ?s)
            (not (on ?c ?s))
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
            (clear ?c)
            (on ?c ?s)
        )
    )

    (:action load_crate
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?t ?p)
            (lifting ?h ?c)
        )
        :effect (and
            (available ?h)
            (not (lifting ?h ?c))
            (in ?c ?t)
        )
    )

    (:action unload_crate
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?t ?p)
            (available ?h)
            (in ?c ?t)
        )
        :effect (and
            (not (in ?c ?t))
            (not (available ?h))
            (lifting ?h ?c)
        )
    )
)