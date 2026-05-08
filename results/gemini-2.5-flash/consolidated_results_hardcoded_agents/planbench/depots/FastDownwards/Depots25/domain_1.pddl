(define (domain Depots25)
    (:requirements :typing :negative-preconditions :action-costs)
    (:types
        place - object
        truck - object
        hoist - object
        surface - object
        pallet - surface
        crate - surface
    )

    (:predicates
        (at ?x - (truck hoist pallet crate) ?p - place)
        (available ?h - hoist)
        (clear ?s - surface)
        (on ?c - crate ?s - surface)
        (lifting ?h - hoist ?c - crate)
        (in ?c - crate ?t - truck)
    )

    (:functions
        (total-cost)
    )

    ;; 1. Drive Truck (from P1 to P2)
    (:action drive-truck
        :parameters (?t - truck ?p1 - place ?p2 - place)
        :precondition (at ?t ?p1)
        :effect (and
            (at ?t ?p2)
            (not (at ?t ?p1))
            (increase (total-cost) 1)
        )
    )

    ;; 2. Lift Crate (by Hoist H, from Surface S, at Place P)
    (:action lift-crate
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
            (at ?h ?p)
            (at ?c ?p)
            (available ?h)
            (clear ?c)
            (on ?c ?s)
        )
        :effect (and
            (lifting ?h ?c)
            (not (available ?h))
            (clear ?s)
            (not (on ?c ?s))
            (not (at ?c ?p))
            (not (clear ?c))
            (increase (total-cost) 1)
        )
    )

    ;; 3. Drop Crate (by Hoist H, to Surface S, at Place P)
    (:action drop-crate
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

    ;; 4. Load Crate (by Hoist H, onto Truck T, at Place P)
    (:action load-crate
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

    ;; 5. Unload Crate (by Hoist H, from Truck T, at Place P)
    (:action unload-crate
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