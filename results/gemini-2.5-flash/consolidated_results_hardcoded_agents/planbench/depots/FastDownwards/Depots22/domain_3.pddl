(define (domain Depots22)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        place - object
        depot distributor - place
        surface - object
        pallet crate - surface
        truck hoist - object
    )

    (:predicates
        (at ?o - object ?p - place)
        (connected ?p1 - place ?p2 - place)
        (available ?h - hoist)
        (lifting ?h - hoist ?c - crate)
        (in ?c - crate ?t - truck)
        (on ?c1 - crate ?s - surface)
        (clear ?s - surface)
    )

    (:functions
        (total-cost)
    )

    ;; 1. Drive: Truck movement
    (:action drive
        :parameters (?t - truck ?p1 - place ?p2 - place)
        :precondition (and
            (at ?t ?p1)
            (connected ?p1 ?p2)
        )
        :effect (and
            (not (at ?t ?p1))
            (at ?t ?p2)
            (increase (total-cost) 1)
        )
    )

    ;; 2. Lift: Crate from surface onto hoist
    (:action lift
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
            (available ?h)
            (at ?h ?p)
            (at ?c ?p)
            (on ?c ?s)
            (clear ?c)
        )
        :effect (and
            (not (available ?h))
            (lifting ?h ?c)
            (not (on ?c ?s))
            (clear ?s)
            (not (at ?c ?p))
            (increase (total-cost) 1)
        )
    )

    ;; 3. Drop: Crate from hoist onto surface
    (:action drop
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
            (at ?c ?p)
            (on ?c ?s)
            (not (clear ?s))
            (clear ?c)
            (increase (total-cost) 1)
        )
    )

    ;; 4. Load: Crate from hoist into truck
    (:action load
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        :precondition (and
            (lifting ?h ?c)
            (at ?h ?p)
            (at ?t ?p)
        )
        :effect (and
            (in ?c ?t)
            (not (lifting ?h ?c))
            (available ?h)
            (increase (total-cost) 1)
        )
    )

    ;; 5. Unload: Crate from truck onto hoist
    (:action unload
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        :precondition (and
            (available ?h)
            (in ?c ?t)
            (at ?h ?p)
            (at ?t ?p)
        )
        :effect (and
            (not (in ?c ?t))
            (not (available ?h))
            (lifting ?h ?c)
            (increase (total-cost) 1)
        )
    )
)