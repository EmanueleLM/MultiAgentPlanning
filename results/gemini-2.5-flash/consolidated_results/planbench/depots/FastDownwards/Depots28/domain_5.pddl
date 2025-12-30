(define (domain Depots28)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        place - object
        depot distributor - place
        surface - object
        pallet crate - surface
        truck hoist - object
    )
    (:predicates
        (at ?o - (either truck hoist surface) ?p - place)
        (on ?c1 - crate ?s2 - surface)
        (clear ?s - surface)
        (available ?h - hoist)
        (lifting ?h - hoist ?c - crate)
        (in ?c - crate ?t - truck)
        (road ?p1 - place ?p2 - place)
    )

    (:functions
        (total-cost)
    )

    ;; LogisticsPlanner: Vehicle Movement
    (:action DRIVE
        :parameters (?t - truck ?p_from - place ?p_to - place)
        :precondition (and
            (at ?t ?p_from)
            (road ?p_from ?p_to)
        )
        :effect (and
            (at ?t ?p_to)
            (not (at ?t ?p_from))
            (increase (total-cost) 1)
        )
    )

    ;; CargoHandler: Handling Operations

    ;; LIFT: Surface -> Hoist
    (:action LIFT
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
            (available ?h)
            (at ?h ?p)
            (at ?c ?p)
            (at ?s ?p)
            (on ?c ?s)
            (clear ?c)
        )
        :effect (and
            (lifting ?h ?c)
            (clear ?s)
            (not (available ?h))
            (not (at ?c ?p))
            (not (on ?c ?s))
            (not (clear ?c))
            (increase (total-cost) 1)
        )
    )

    ;; DROP: Hoist -> Surface
    (:action DROP
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
            (lifting ?h ?c)
            (at ?h ?p)
            (at ?s ?p)
            (clear ?s)
        )
        :effect (and
            (on ?c ?s)
            (at ?c ?p)
            (clear ?c)
            (available ?h)
            (not (lifting ?h ?c))
            (not (clear ?s))
            (increase (total-cost) 1)
        )
    )

    ;; LOAD: Hoist -> Truck
    (:action LOAD
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        :precondition (and
            (lifting ?h ?c)
            (at ?h ?p)
            (at ?t ?p)
        )
        :effect (and
            (in ?c ?t)
            (available ?h)
            (not (lifting ?h ?c))
            (increase (total-cost) 1)
        )
    )

    ;; UNLOAD: Truck -> Hoist
    (:action UNLOAD
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        :precondition (and
            (in ?c ?t)
            (available ?h)
            (at ?h ?p)
            (at ?t ?p)
        )
        :effect (and
            (lifting ?h ?c)
            (not (in ?c ?t))
            (not (available ?h))
            (increase (total-cost) 1)
        )
    )