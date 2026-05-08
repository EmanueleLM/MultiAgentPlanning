(define (domain depots32)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        place
        surface
        depot - place
        distributor - place
        pallet - surface
        crate - surface
        truck
        hoist
    )
    (:predicates
        (at ?obj - (or truck hoist crate pallet) ?loc - place)
        (available ?h - hoist)
        (clear ?s - surface)
        (lifting ?h - hoist ?c - crate)
        (in ?c - crate ?t - truck)
        (on ?c - crate ?s - surface)
        (connected ?p1 - place ?p2 - place)
    )

    (:action drive_truck
        :parameters (?t - truck ?p1 - place ?p2 - place)
        :precondition (and
            (at ?t ?p1)
            (connected ?p1 ?p2)
        )
        :effect (and
            (not (at ?t ?p1))
            (at ?t ?p2)
        )
    )

    (:action lift_crate
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?c ?p)
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
            (in ?c ?t)
            (not (lifting ?h ?c))
            (available ?h)
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
            (not (at ?c ?p))
        )
    )
)