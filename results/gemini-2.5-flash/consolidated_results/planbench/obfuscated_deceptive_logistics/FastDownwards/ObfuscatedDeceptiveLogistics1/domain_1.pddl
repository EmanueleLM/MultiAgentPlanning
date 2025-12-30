(define (domain ObfuscatedDeceptiveLogistics1)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types object)

    (:predicates
        (cats ?o - object)
        (collect ?o0 - object ?o1 - object)
        (hand ?o - object)
        (next ?o0 - object ?o1 - object)
        (sneeze ?o - object)
        (spring ?o - object)
        (stupendous ?o - object)
        (texture ?o - object)
    )

    (:functions
        (total-cost)
    )

    ; Action 1: Paltry(?o0 ?o1 ?o2) - Reassigns next location for objects with (hand) status
    (:action Paltry
        :parameters (?o0 - object ?o1 - object ?o2 - object)
        :precondition (and (next ?o0 ?o1) (hand ?o0) (spring ?o2) (not (= ?o1 ?o2)))
        :effect (and 
            (not (next ?o0 ?o1)) 
            (next ?o0 ?o2)
            (increase (total-cost) 1)
        )
    )

    ; Action 2: Sip(?o0 ?o1 ?o2)
    (:action Sip
        :parameters (?o0 - object ?o1 - object ?o2 - object)
        :precondition (and (collect ?o1 ?o2) (next ?o0 ?o1))
        :effect (and 
            (increase (total-cost) 1)
        )
    )
    
    ; Action 3: Clip(?o0 ?o1 ?o2)
    (:action Clip
        :parameters (?o0 - object ?o1 - object ?o2 - object)
        :precondition (and (next ?o1 ?o2) (sneeze ?o0))
        :effect (and
            (increase (total-cost) 1)
        )
    )

    ; Action 4: Wretched(?o0 ?o1 ?o2 ?o3) - Reassignment with 4 parameters
    (:action Wretched
        :parameters (?o0 - object ?o1 - object ?o2 - object ?o3 - object)
        :precondition (and (hand ?o0) (next ?o0 ?o1) (spring ?o2) (texture ?o3) (not (= ?o1 ?o3)))
        :effect (and
            (not (next ?o0 ?o1))
            (next ?o0 ?o3)
            (increase (total-cost) 1)
        )
    )
    
    ; Action 5: Memory(?o0 ?o1 ?o2) - Sets collect status
    (:action Memory
        :parameters (?o0 - object ?o1 - object ?o2 - object)
        :precondition (and (texture ?o1) (stupendous ?o2) (next ?o0 ?o1))
        :effect (and
            (collect ?o0 ?o2)
            (increase (total-cost) 1)
        )
    )
    
    ; Action 6: Tightfisted(?o0 ?o1 ?o2) - Reassigns next location (similar to Paltry)
    (:action Tightfisted
        :parameters (?o0 - object ?o1 - object ?o2 - object)
        :precondition (and (hand ?o0) (next ?o0 ?o1) (spring ?o2) (not (= ?o1 ?o2)))
        :effect (and 
            (not (next ?o0 ?o1)) 
            (next ?o0 ?o2)
            (increase (total-cost) 1)
        )
    )
)