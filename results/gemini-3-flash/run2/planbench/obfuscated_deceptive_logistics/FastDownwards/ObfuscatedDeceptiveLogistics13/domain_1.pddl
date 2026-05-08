(define (domain obfuscated_logistics)
    (:requirements :strips :typing)
    (:types
        hand cats sneeze stupendous texture - object
        spring - texture
    )

    (:predicates
        (vase ?v - hand ?p - object)
        (next ?o - object ?l - texture)
        (collect ?l - texture ?s - stupendous)
        (hand ?v - hand)
        (cats ?p - cats)
        (sneeze ?p - sneeze)
        (texture ?l - texture)
        (spring ?l - spring)
        (stupendous ?s - stupendous)
    )

    (:action paltry
        :parameters (?o0 - hand ?o1 - cats ?o2 - texture)
        :precondition (and (hand ?o0) (cats ?o1) (texture ?o2) (vase ?o0 ?o1) (next ?o1 ?o2))
        :effect (and (next ?o0 ?o2) (not (vase ?o0 ?o1)))
    )

    (:action sip
        :parameters (?o0 - hand ?o1 - cats ?o2 - texture)
        :precondition (and (hand ?o0) (cats ?o1) (texture ?o2) (next ?o0 ?o2) (next ?o1 ?o2))
        :effect (and (vase ?o0 ?o1) (not (next ?o0 ?o2)))
    )

    (:action clip
        :parameters (?o0 - hand ?o1 - sneeze ?o2 - texture)
        :precondition (and (hand ?o0) (sneeze ?o1) (texture ?o2) (next ?o1 ?o2) (next ?o0 ?o2))
        :effect (and (vase ?o0 ?o1) (not (next ?o0 ?o2)))
    )

    (:action wretched
        :parameters (?o0 - sneeze ?o1 - texture ?o2 - texture ?o3 - stupendous)
        :precondition (and (sneeze ?o0) (texture ?o1) (texture ?o2) (stupendous ?o3) (next ?o0 ?o1) (collect ?o1 ?o3) (collect ?o2 ?o3))
        :effect (and (next ?o0 ?o2) (not (next ?o0 ?o1)))
    )

    (:action memory
        :parameters (?o0 - cats ?o1 - spring ?o2 - spring)
        :precondition (and (cats ?o0) (spring ?o1) (spring ?o2) (next ?o0 ?o1))
        :effect (and (next ?o0 ?o2) (not (next ?o0 ?o1)))
    )

    (:action tightfisted
        :parameters (?o0 - hand ?o1 - sneeze ?o2 - texture)
        :precondition (and (hand ?o0) (sneeze ?o1) (texture ?o2) (next ?o1 ?o2) (vase ?o0 ?o1))
        :effect (and (next ?o0 ?o2) (not (vase ?o0 ?o1)))
    )
)