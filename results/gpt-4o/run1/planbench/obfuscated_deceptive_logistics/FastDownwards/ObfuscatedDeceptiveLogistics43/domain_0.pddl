(define (domain jack_of_all_trades)
  (:requirements :strips :typing :negative-preconditions)
  (:types hand cats sneeze spring stupendous texture collect)
  
  (:predicates
    (hand ?o - hand)
    (cats ?o - cats)
    (sneeze ?o - sneeze)
    (spring ?o - spring)
    (stupendous ?o - stupendous)
    (texture ?o - texture)
    (collect ?o1 ?o2 - collect)
    (next ?o1 ?o2 - cats)
    (vase ?o1 ?o2 - hand)
  )

  (:action paltry
    :parameters (?o0 - hand ?o1 - cats ?o2 - texture)
    :precondition (and (hand ?o0) (cats ?o1) (texture ?o2) (vase ?o0 ?o1) (next ?o1 ?o2))
    :effect (and (not (vase ?o0 ?o1)) (next ?o0 ?o2))
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