(define (domain Depots2)
    (:requirements :typing :negative-preconditions :action-costs)
    (:types
        place truck hoist - object
        surface - object
        crate pallet - surface
    )
    (:predicates
        (at ?o - (either truck hoist crate pallet) ?p - place)
        (available ?h - hoist)
        (clear ?s - surface)
        (on ?c - crate ?s - surface)
        (lifting ?h - hoist ?c - crate)
        (in ?c - crate ?t - truck)
    )
    (:functions
        (total-cost) - number
    )

    (:action DRIVE
        :parameters (?t - truck ?p1 - place ?p2 - place)
        :precondition (at ?t ?p1)
        :effect (and
            (not (at ?t ?p1))
            (at ?t ?p2)
            (increase (total-cost) 1)
        )
    )

    (:action LIFT
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
            (available ?h)
            (at ?h ?p)
            (at ?s ?p)
            (at ?c ?p)
            (on ?c ?s)
            (clear ?c)
        )
        :effect (and
            (not (available ?h))
            (lifting ?h ?c)
            (not (on ?c ?s))
            (not (at ?c ?p)) 
            (not (clear ?c)) 
            (clear ?s)
            (increase (total-cost) 1)
        )
    )

    (:action DROP
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
            (lifting ?h ?c)
            (at ?h ?p)
            (at ?s ?p)
            (clear ?s)
        )
        :effect (and
            (available ?h)
            (not (lifting ?h ?c))
            (on ?c ?s)
            (at ?c ?p)
            (clear ?c)
            (not (clear ?s))
            (increase (total-cost) 1)
        )
    )

    (:action LOAD
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        :precondition (and
            (lifting ?h ?c)
            (at ?h ?p)
            (at ?t ?p)
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
            (available ?h)
            (at ?h ?p)
            (at ?t ?p)
            (in ?c ?t)
        )
        :effect (and
            (not (available ?h))
            (lifting ?h ?c)
            (not (in ?c ?t))
            (increase (total-cost) 1)
        )
    )
)