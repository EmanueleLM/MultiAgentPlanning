(define (domain jack_of_all_trades)
  (:requirements :strips :typing :negative-preconditions)
  (:types hand_type cats_type sneeze_type spring_type stupendous_type texture_type collect_type object)

  (:predicates
    (hand ?o - hand_type)
    (cats ?o - cats_type)
    (sneeze ?o - sneeze_type)
    (spring ?o - spring_type)
    (stupendous ?o - stupendous_type)
    (texture ?o - texture_type)
    (collect ?o1 ?o2 - collect_type)
    (next ?o1 ?o2 - object)
    (vase ?o1 ?o2 - hand_type)
  )

  (:action paltry
    :parameters (?o0 - hand_type ?o1 - cats_type ?o2 - texture_type)
    :precondition (and (hand ?o0) (cats ?o1) (texture ?o2) (vase ?o0 ?o1) (next ?o1 ?o2))
    :effect (and (not (vase ?o0 ?o1)) (next ?o0 ?o2))
  )

  (:action sip
    :parameters (?o0 - hand_type ?o1 - cats_type ?o2 - texture_type)
    :precondition (and (hand ?o0) (cats ?o1) (texture ?o2) (next ?o0 ?o2) (next ?o1 ?o2))
    :effect (and (vase ?o0 ?o1) (not (next ?o0 ?o2)))
  )

  (:action clip
    :parameters (?o0 - hand_type ?o1 - sneeze_type ?o2 - texture_type)
    :precondition (and (hand ?o0) (sneeze ?o1) (texture ?o2) (next ?o1 ?o2) (next ?o0 ?o2))
    :effect (and (vase ?o0 ?o1) (not (next ?o0 ?o2)))
  )

  (:action wretched
    :parameters (?o0 - sneeze_type ?o1 - texture_type ?o2 - texture_type ?o3 - stupendous_type)
    :precondition (and (sneeze ?o0) (texture ?o1) (texture ?o2) (stupendous ?o3) (next ?o0 ?o1) (collect ?o1 ?o3) (collect ?o2 ?o3))
    :effect (and (next ?o0 ?o2) (not (next ?o0 ?o1)))
  )

  (:action memory
    :parameters (?o0 - cats_type ?o1 - spring_type ?o2 - spring_type)
    :precondition (and (cats ?o0) (spring ?o1) (spring ?o2) (next ?o0 ?o1))
    :effect (and (next ?o0 ?o2) (not (next ?o0 ?o1)))
  )

  (:action tightfisted
    :parameters (?o0 - hand_type ?o1 - sneeze_type ?o2 - texture_type)
    :precondition (and (hand ?o0) (sneeze ?o1) (texture ?o2) (next ?o1 ?o2) (vase ?o0 ?o1))
    :effect (and (next ?o0 ?o2) (not (vase ?o0 ?o1)))
  )
)