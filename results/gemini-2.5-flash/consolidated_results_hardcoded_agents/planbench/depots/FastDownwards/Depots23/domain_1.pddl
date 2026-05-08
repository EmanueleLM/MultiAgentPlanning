(define (domain Depots23)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        place - object
        depot distributor - place
        surface - object
        crate pallet - surface
        truck hoist - object
    )

    (:predicates
        (at ?e - object ?p - place) ; Location of truck, hoist, crate, pallet
        (on ?c - crate ?s - surface)
        (clear ?s - surface)
        (in ?c - crate ?t - truck)
        (available ?h - hoist)
        (lifting ?h - hoist ?c - crate)
    )

    (:functions
        (total-cost) - number
    )

    (:action drive
        :parameters (?t - truck ?o - place ?d - place)
        :precondition (and
            (at ?t ?o)
            (not (= ?o ?d))
        )
        :effect (and
            (not (at ?t ?o))
            (at ?t ?d)
            (increase (total-cost) 1)
        )
    )

    (:action lift
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
            (not (available ?h))
            (lifting ?h ?c)
            (clear ?s)
            (not (on ?c ?s))
            (increase (total-cost) 1)
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
            (in ?c ?t)
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
            (in ?c ?t)
        )
        :effect (and
            (not (in ?c ?t))
            (not (available ?h))
            (lifting ?h ?c)
            (increase (total-cost) 1)
        )
    )
)