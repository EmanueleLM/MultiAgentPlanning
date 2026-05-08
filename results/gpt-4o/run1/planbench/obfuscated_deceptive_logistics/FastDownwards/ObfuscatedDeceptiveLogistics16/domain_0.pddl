(define (domain object_manipulation)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    hand_holder cat_holder sneeze_holder texture_holder stupendous_object obj
  )
  (:predicates
    (hand ?x - hand_holder)
    (cats ?x - cat_holder)
    (sneeze ?x - sneeze_holder)
    (texture ?x - texture_holder)
    (spring ?x - texture_holder)
    (stupendous ?x - stupendous_object)
    (vase ?x ?y - obj)
    (collect ?x ?y - obj)
    (next ?x ?y - obj)
  )
  (:action paltry
    :parameters (?o0 - hand_holder ?o1 - cat_holder ?o2 - texture_holder)
    :precondition (and (hand ?o0) (cats ?o1) (texture ?o2) (vase ?o0 ?o1) (next ?o1 ?o2))
    :effect (and (next ?o0 ?o2) (not (vase ?o0 ?o1)))
  )
  (:action sip
    :parameters (?o0 - hand_holder ?o1 - cat_holder ?o2 - texture_holder)
    :precondition (and (hand ?o0) (cats ?o1) (texture ?o2) (next ?o0 ?o2) (next ?o1 ?o2))
    :effect (and (vase ?o0 ?o1) (not (next ?o0 ?o2)))
  )
  (:action clip
    :parameters (?o0 - hand_holder ?o1 - sneeze_holder ?o2 - texture_holder)
    :precondition (and (hand ?o0) (sneeze ?o1) (texture ?o2) (next ?o1 ?o2) (next ?o0 ?o2))
    :effect (and (vase ?o0 ?o1) (not (next ?o0 ?o2)))
  )
  (:action wretched
    :parameters (?o0 - sneeze_holder ?o1 - texture_holder ?o2 - texture_holder ?o3 - stupendous_object)
    :precondition (and (sneeze ?o0) (texture ?o1) (texture ?o2) (stupendous ?o3)
                       (next ?o0 ?o1) (collect ?o1 ?o3) (collect ?o2 ?o3))
    :effect (and (next ?o0 ?o2) (not (next ?o0 ?o1)))
  )
  (:action memory
    :parameters (?o0 - cat_holder ?o1 - texture_holder ?o2 - texture_holder)
    :precondition (and (cats ?o0) (spring ?o1) (spring ?o2) (next ?o0 ?o1))
    :effect (and (next ?o0 ?o2) (not (next ?o0 ?o1)))
  )
  (:action tightfisted
    :parameters (?o0 - hand_holder ?o1 - sneeze_holder ?o2 - texture_holder)
    :precondition (and (hand ?o0) (sneeze ?o1) (texture ?o2) (next ?o1 ?o2) (vase ?o0 ?o1))
    :effect (and (next ?o0 ?o2) (not (vase ?o0 ?o1)))
  )
)