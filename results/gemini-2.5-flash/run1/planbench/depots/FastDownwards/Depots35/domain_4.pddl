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
            (clear ?c)
            (at ?s ?p)
        )
        :effect (and
            (not (at ?c ?p))
            (not (on ?c ?s))
            (clear ?s)
            (lifting ?h ?c)
            (not (available ?h))
            (not (clear ?c))
        )
    )

    (:action drop
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?s ?p)
            (clear ?s)
            (lifting ?h ?c)
        )
        :effect (and
            (not (lifting ?h ?c))
            (available ?h)
            (at ?c ?p)
            (on ?c ?s)
            (not (clear ?s))
            (clear ?c)
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
            (not (clear ?c))
        )
    )

    (:action unload
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
            (not (clear ?c))
        )
    )
)