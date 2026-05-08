(define (domain obfuscateddeceptivelogistics)
    (:requirements :strips :typing :negative-preconditions)
    (:types object)
    (:predicates
        (hand ?o - object)
        (cats ?o - object)
        (texture ?o - object)
        (sneeze ?o - object)
        (stupendous ?o - object)
        (spring ?o - object)
        
        (vase ?o1 - object ?o2 - object)
        (next ?o1 - object ?o2 - object)
        (collect ?o1 - object ?o2 - object)
    )

    (:action paltry
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

    (:action sip
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

    (:action clip
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

    (:action wretched
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

    (:action memory
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

    (:action tightfisted
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