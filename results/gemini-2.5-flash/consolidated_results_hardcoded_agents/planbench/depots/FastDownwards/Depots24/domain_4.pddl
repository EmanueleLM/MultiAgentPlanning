(define (domain Depots24)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        place depot distributor - place
        surface pallet crate - surface
        vehicle truck - vehicle
        equipment hoist - equipment
    )

    (:predicates
        (at ?o - object ?p - place)
        (hoist-at ?h - hoist ?p - place)
        (on ?s1 - crate ?s2 - surface)
        (clear ?s - surface)
        (carrying ?h - hoist ?c - crate)
        (available ?h - hoist)
        (in-truck ?c - crate ?t - truck)
    )
    
    (:functions
        (total-cost) - number
    )

    ;; 1. DRIVE Truck
    (:action DRIVE
        :parameters (?t - truck ?p_from - place ?p_to - place)
        :precondition (and 
            (at ?t ?p_from)
            (not (= ?p_from ?p_to))
        )
        :effect (and
            (not (at ?t ?p_from))
            (at ?t ?p_to)
            (increase (total-cost) 1)
        )
    )

    ;; 2. LIFT Crate from Ground Surface onto Hoist
    (:action LIFT-FROM-SURFACE
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and 
            (hoist-at ?h ?p)
            (available ?h)
            (on ?c ?s)
            (clear ?c)
            (at ?c ?p) 
            (at ?s ?p) 
        )
        :effect (and
            (not (available ?h))
            (carrying ?h ?c)
            (not (on ?c ?s))
            (clear ?s)
            (not (at ?c ?p)) 
            (increase (total-cost) 1)
        )
    )
    
    ;; 3. DROP Crate from Hoist onto Ground Surface
    (:action DROP-TO-SURFACE
        :parameters (?h - hoist ?c - crate ?s - surface ?p - place)
        :precondition (and
            (hoist-at ?h ?p)
            (carrying ?h ?c)
            (clear ?s)
            (at ?s ?p) 
        )
        :effect (and
            (available ?h)
            (not (carrying ?h ?c))
            (on ?c ?s)
            (not (clear ?s))
            (clear ?c)
            (at ?c ?p) 
            (increase (total-cost) 1)
        )
    )
    
    ;; 4. LOAD Crate from Hoist into Truck
    (:action LOAD
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        :precondition (and
            (hoist-at ?h ?p)
            (at ?t ?p)
            (carrying ?h ?c)
        )
        :effect (and
            (available ?h)
            (not (carrying ?h ?c))
            (in-truck ?c ?t)
            (increase (total-cost) 1)
        )
    )

    ;; 5. UNLOAD Crate from Truck onto Hoist
    (:action UNLOAD
        :parameters (?h - hoist ?c - crate ?t - truck ?p - place)
        :precondition (and
            (hoist-at ?h ?p)
            (at ?t ?p)
            (in-truck ?c ?t)
            (available ?h)
        )
        :effect (and
            (not (available ?h))
            (carrying ?h ?c)
            (not (in-truck ?c ?t))
            (increase (total-cost) 1)
        )
    )