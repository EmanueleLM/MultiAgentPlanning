(define (domain Depots3)
    (:requirements :strips :typing :negative-preconditions)
    (:types
        place surface - object
        depot distributor - place
        truck - object
        hoist - object
        crate - surface
        pallet - surface
    )
    (:predicates
        (at ?obj - (truck hoist crate) ?place - place)
        (on ?c - crate ?s - surface)
        (in ?c - crate ?t - truck)
        (clear ?s - surface)
        (available ?h - hoist)
        (lifting ?h - hoist ?c - crate)
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
        :parameters (?h - hoist ?c - crate ?p - place ?s - surface)
        :precondition (and
            (at ?h ?p)
            (at ?c ?p)
            (available ?h)
            (on ?c ?s)
            (clear ?c)
            (not (clear ?s))
        )
        :effect (and
            (not (at ?c ?p))
            (lifting ?h ?c)
            (not (available ?h))
            (clear ?s)
            (not (on ?c ?s))
        )
    )

    (:action drop
        :parameters (?h - hoist ?c - crate ?p - place ?s - surface)
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

    (:action load
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?t ?p)
            (lifting ?h ?c)
        )
        :effect (and
            (in ?c ?t)
            (available ?h)
            (not (lifting ?h ?c))
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
        )
    )
)