(define (domain ObfuscatedDeceptiveLogistics0)
    (:requirements :strips :typing :action-costs)
    (:types object)
    
    (:predicates
        (hand ?o - object)
        (cats ?o - object)
        (texture ?o - object)
        (vase ?o0 ?o1 - object)
        (next ?o0 ?o1 - object)
        (sneeze ?o - object)
        (stupendous ?o - object)
        (collect ?o0 ?o1 - object)
        (spring ?o - object)
    )

    (:functions
        (total-cost)
    )

    ;; Action PALTRY(o0, o1, o2): PRE: (hand o0), (cats o1), (texture o2), (vase o0 o1), (next o1 o2). EFF: (and (next o0 o2) (not (vase o0 o1)))
    (:action PALTRY
        :parameters (?o0 ?o1 ?o2 - object)
        :precondition (and 
            (hand ?o0) 
            (cats ?o1) 
            (texture ?o2) 
            (vase ?o0 ?o1) 
            (next ?o1 ?o2)
        )
        :effect (and 
            (next ?o0 ?o2) 
            (not (vase ?o0 ?o1))
            (increase (total-cost) 1)
        )
    )

    ;; Action SIP(o0, o1, o2): PRE: (hand o0), (cats o1), (texture o2), (next o0 o2), (next o1 o2). EFF: (and (vase o0 o1) (not (next o0 o2)))
    (:action SIP
        :parameters (?o0 ?o1 ?o2 - object)
        :precondition (and 
            (hand ?o0) 
            (cats ?o1) 
            (texture ?o2) 
            (next ?o0 ?o2) 
            (next ?o1 ?o2)
        )
        :effect (and 
            (vase ?o0 ?o1) 
            (not (next ?o0 ?o2))
            (increase (total-cost) 1)
        )
    )

    ;; Action CLIP(o0, o1, o2): PRE: (hand o0), (sneeze o1), (texture o2), (next o1 o2), (next o0 o2). EFF: (and (vase o0 o1) (not (next o0 o2)))
    (:action CLIP
        :parameters (?o0 ?o1 ?o2 - object)
        :precondition (and 
            (hand ?o0) 
            (sneeze ?o1) 
            (texture ?o2) 
            (next ?o1 ?o2) 
            (next ?o0 ?o2)
        )
        :effect (and 
            (vase ?o0 ?o1) 
            (not (next ?o0 ?o2))
            (increase (total-cost) 1)
        )
    )

    ;; Action WRETCHED(o0, o1, o2, o3): PRE: (sneeze o0), (texture o1), (texture o2), (stupendous o3), (next o0 o1), (collect o1 o3), (collect o2 o3). EFF: (and (next o0 o2) (not (next o0 o1)))
    (:action WRETCHED
        :parameters (?o0 ?o1 ?o2 ?o3 - object)
        :precondition (and 
            (sneeze ?o0) 
            (texture ?o1) 
            (texture ?o2) 
            (stupendous ?o3) 
            (next ?o0 ?o1) 
            (collect ?o1 ?o3) 
            (collect ?o2 ?o3)
        )
        :effect (and 
            (next ?o0 ?o2) 
            (not (next ?o0 ?o1))
            (increase (total-cost) 1)
        )
    )

    ;; Action MEMORY(o0, o1, o2): PRE: (cats o0), (spring o1), (spring o2), (next o0 o1). EFF: (and (next o0 o2) (not (next o0 o1)))
    (:action MEMORY
        :parameters (?o0 ?o1 ?o2 - object)
        :precondition (and 
            (cats ?o0) 
            (spring ?o1) 
            (spring ?o2) 
            (next ?o0 ?o1)
        )
        :effect (and 
            (next ?o0 ?o2) 
            (not (next ?o0 ?o1))
            (increase (total-cost) 1)
        )
    )

    ;; Action TIGHTFISTED(o0, o1, o2): PRE: (hand o0), (sneeze o1), (texture o2), (next o1 o2), (vase o0 o1). EFF: (and (next o0 o2) (not (vase o0 o1)))
    (:action TIGHTFISTED
        :parameters (?o0 ?o1 ?o2 - object)
        :precondition (and 
            (hand ?o0) 
            (sneeze ?o1) 
            (texture ?o2) 
            (next ?o1 ?o2) 
            (vase ?o0 ?o1)
        )
        :effect (and 
            (next ?o0 ?o2) 
            (not (vase ?o0 ?o1))
            (increase (total-cost) 1)
        )
    )
)