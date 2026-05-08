(define (domain depots)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        place object
        depot distributor - place
        locatable - object
        truck hoist - locatable
        surface - locatable
        pallet crate - surface
    )
    (:predicates
        (at ?obj - locatable ?loc - place)
        (available ?h - hoist)
        (clear ?s - surface)
        (lifting ?h - hoist ?c - crate)
        (on ?c - crate ?s - surface)
        (in-truck ?c - crate ?t - truck)
    )

    (:action drive
        :parameters (?t - truck ?from - place ?to - place)
        :precondition (and
            (at ?t ?from)
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
            (at ?s ?p)
            (on ?c ?s)
            (available ?h)
            (clear ?c)
        )
        :effect (and
            (not (at ?c ?p))
            (not (on ?c ?s))
            (not (available ?h))
            (clear ?s)
            (lifting ?h ?c)
        )
    )

    (:action drop
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?s ?p)
            (lifting ?h ?c)
            (clear ?s)
        )
        :effect (and
            (not (lifting ?h ?c))
            (not (clear ?s))
            (available ?h)
            (at ?c ?p)
            (on ?c ?s)
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
            (not (at ?c ?p))
            (available ?h)
            (in-truck ?c ?t)
        )
    )

    (:action unload
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