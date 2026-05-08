(define (domain depots)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        place
        truck
        hoist
        surface
        crate pallet - surface
        depot distributor - place
    )

    (:predicates
        (at ?x - (either truck hoist surface) ?p - place)
        (connected ?p1 ?p2 - place)
        (lifting ?h - hoist ?c - crate)
        (in ?c - crate ?t - truck)
        (on ?c - crate ?s - surface)
        (clear ?s - surface)
        (available ?h - hoist)
    )

    (:functions
        (total-cost) - number
    )

    ;; 1. Drive Truck
    (:action drive
        :parameters (?t - truck ?pfrom ?pto - place)
        :precondition (and
            (at ?t ?pfrom)
            (connected ?pfrom ?pto)
        )
        :effect (and
            (not (at ?t ?pfrom))
            (at ?t ?pto)
            (increase (total-cost) 1)
        )
    )

    ;; 2. Lift Crate from Surface (Surface S must be at P, C must be topmost item)
    (:action lift
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
            (not (available ?h))
            (lifting ?h ?c)
            (not (at ?c ?p))
            (not (on ?c ?s))
            (clear ?s)
            (increase (total-cost) 1)
        )
    )

    ;; 3. Drop Crate onto Surface
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
            (increase (total-cost) 1)
        )
    )

    ;; 4. Load Crate into Truck
    (:action load
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

    ;; 5. Unload Crate from Truck
    (:action unload
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