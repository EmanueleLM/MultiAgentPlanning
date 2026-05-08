(define (domain depots1)
    (:requirements :typing :negative-preconditions :action-costs)
    (:types
        place - object
        depot distributor - place
        surface - object
        pallet crate - surface
        truck hoist - object
    )

    (:predicates
        (at ?o - (or truck hoist surface) ?p - place)
        (in-truck ?c - crate ?t - truck)
        (on ?c - crate ?s - surface)
        (clear ?s - surface)
        (available ?h - hoist)
        (lifting ?h - hoist ?c - crate)
    )

    (:functions
        (total-cost)
    )

    (:action drive
        :parameters (?t - truck ?from - place ?to - place)
        :precondition (and
            (at ?t ?from)
            (not (= ?from ?to))
        )
        :effect (and
            (not (at ?t ?from))
            (at ?t ?to)
            (increase (total-cost) 1)
        )
    )

    (:action lift
        :parameters (?h - hoist ?c - crate ?p - place ?s - surface)
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
            (increase (total-cost) 1)
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
            (increase (total-cost) 1)
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
            (in-truck ?c ?t)
            (available ?h)
            (not (lifting ?h ?c))
            (increase (total-cost) 1)
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
            (increase (total-cost) 1)
        )
    )
)