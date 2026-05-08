(define (domain ObfuscatedDeceptiveLogistics1)
    (:requirements :strips :typing :negative-preconditions)
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
        (vase ?o0 - object ?o1 - object)
    )

    ; 1. Paltry object_0 object_1 object_2
    ; P: hand ?o0, cats ?o1, texture ?o2, vase ?o0 ?o1, and next ?o1 ?o2
    ; E Add: next ?o0 ?o2 | E Del: vase ?o0 ?o1
    (:action Paltry
        :parameters (?o0 - object ?o1 - object ?o2 - object)
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
        )
    )

    ; 2. Sip object_0 object_1 object_2
    ; P: hand ?o0, cats ?o1, texture ?o2, next ?o0 ?o2, and next ?o1 ?o2
    ; E Add: vase ?o0 ?o1 | E Del: next ?o0 ?o2
    (:action Sip
        :parameters (?o0 - object ?o1 - object ?o2 - object)
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
        )
    )
    
    ; 3. Clip object_0 object_1 object_2
    ; P: hand ?o0, sneeze ?o1, texture ?o2, next ?o1 ?o2, and next ?o0 ?o2
    ; E Add: vase ?o0 ?o1 | E Del: next ?o0 ?o2
    (:action Clip
        :parameters (?o0 - object ?o1 - object ?o2 - object)
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
        )
    )

    ; 4. Wretched object_0 object_1 object_2 object_3
    ; P: sneeze ?o0, texture ?o1, texture ?o2, stupendous ?o3, next ?o0 ?o1, collect ?o1 ?o3, and collect ?o2 ?o3
    ; E Add: next ?o0 ?o2 | E Del: next ?o0 ?o1
    (:action Wretched
        :parameters (?o0 - object ?o1 - object ?o2 - object ?o3 - object)
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
        )
    )
    
    ; 5. Memory object_0 object_1 object_2
    ; P: cats ?o0, spring ?o1, spring ?o2, and next ?o0 ?o1
    ; E Add: next ?o0 ?o2 | E Del: next ?o0 ?o1
    (:action Memory
        :parameters (?o0 - object ?o1 - object ?o2 - object)
        :precondition (and 
            (cats ?o0) 
            (spring ?o1) 
            (spring ?o2) 
            (next ?o0 ?o1)
        )
        :effect (and 
            (next ?o0 ?o2)
            (not (next ?o0 ?o1))
        )
    )
    
    ; 6. Tightfisted object_0 object_1 object_2
    ; P: hand ?o0, sneeze ?o1, texture ?o2, next ?o1 ?o2, and vase ?o0 ?o1
    ; E Add: next ?o0 ?o2 | E Del: vase ?o0 ?o1
    (:action Tightfisted
        :parameters (?o0 - object ?o1 - object ?o2 - object)
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
        )
    )
)