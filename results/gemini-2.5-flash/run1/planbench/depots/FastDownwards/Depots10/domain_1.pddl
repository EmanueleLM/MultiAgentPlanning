(define (domain depots)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        place
        surface
        truck
        hoist
        crate - surface
        pallet - surface
    )

    (:predicates
        (at ?obj - (truck hoist pallet) ?p - place)
        (on ?c - crate ?s - surface)
        (in-truck ?c - crate ?t - truck)
        (clear ?s - surface)
        (available ?h - hoist)
        (lifting ?h - hoist ?c - crate)
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
            (on ?c ?s)
            (at ?s ?p)
            (available ?h)
            (clear ?c)
        )
        :effect (and
            (not (on ?c ?s))
            (not (available ?h))
            (lifting ?h ?c)
            (clear ?s)
            (not (clear ?c))
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
            (on ?c ?s)
            (not (clear ?s))
            (clear ?c)
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
            (in-truck ?c ?t)
            (available ?h)
            (not (lifting ?h ?c))
            ; Effects for loading not fully specified in human input, inferring standard
            ; crate is no longer being lifted, hoist becomes available.
        )
    )

    (:action unload_crate
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?t ?p)
            (available ?h)
            (in-truck ?c ?t)
        )
        :effect (and
            (not (in-truck ?c ?t))
            (not (available ?h))
            (lifting ?h ?c)
        )
    )
)