(define (domain Depots)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        place
        depot distributor - place
        surface
        pallet crate - surface
        hoist truck - object
    )
    (:predicates
        (at ?o - (either truck hoist surface) ?p - place)
        (on ?c - crate ?s - surface)
        (clear ?s - surface)
        (available ?h - hoist)
        (lifting ?h - hoist ?c - crate)
        (in ?c - crate ?t - truck)
    )
    (:functions
        (total-cost) - number
    )

    (:action Drive
        :parameters (?t - truck ?p1 - place ?p2 - place)
        :precondition (and
            (at ?t ?p1)
        )
        :effect (and
            (not (at ?t ?p1))
            (at ?t ?p2)
            (increase (total-cost) 1)
        )
    )

    (:action Lift
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?s ?p)
            (on ?c ?s)
            (available ?h)
            (clear ?c)
        )
        :effect (and
            (not (on ?c ?s))
            (not (available ?h))
            (lifting ?h ?c)
            (clear ?s)
            (not (at ?c ?p))
            (increase (total-cost) 1)
        )
    )

    (:action Drop
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
            (increase (total-cost) 1)
        )
    )

    (:action Load
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
            (increase (total-cost) 1)
        )
    )

    (:action Unload
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
            (increase (total-cost) 1)
        )
    )