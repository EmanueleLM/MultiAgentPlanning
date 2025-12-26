(define (domain Depots2)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        place
        truck
        hoist
        surface - object
        pallet - surface
        crate - surface
    )

    (:predicates
        (at ?o - (or truck hoist crate pallet) ?p - place)
        (on ?c - crate ?s - surface)
        (in ?c - crate ?t - truck)
        (clear ?s - surface)
        (available ?h - hoist)
        (lifting ?h - hoist ?c - crate)
    )
    
    (:functions
        (total-cost) - number
    )

    (:action DRIVE
        :parameters (?t - truck ?from - place ?to - place)
        :precondition (at ?t ?from)
        :effect (and 
            (not (at ?t ?from))
            (at ?t ?to)
            (increase (total-cost) 1)
        )
    )

    (:action LIFT
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?c ?p)
            (available ?h)
            (clear ?c)
            (on ?c ?s)
        )
        :effect (and
            (not (available ?h))
            (not (clear ?c))
            (not (on ?c ?s))
            (lifting ?h ?c)
            (clear ?s)
            (increase (total-cost) 1)
        )
    )

    (:action DROP
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?s ?p)
            (lifting ?h ?c)
            (clear ?s)
        )
        :effect (and
            (available ?h)
            (not (lifting ?h ?c))
            (not (clear ?s))
            (clear ?c)
            (on ?c ?s)
            (increase (total-cost) 1)
        )
    )

    (:action LOAD
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
            (increase (total-cost) 1)
        )
    )

    (:action UNLOAD
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?t ?p)
            (available ?h)
            (in ?c ?t)
        )
        :effect (and
            (not (available ?h))
            (not (in ?c ?t))
            (lifting ?h ?c)
            (increase (total-cost) 1)
        )
    )
)