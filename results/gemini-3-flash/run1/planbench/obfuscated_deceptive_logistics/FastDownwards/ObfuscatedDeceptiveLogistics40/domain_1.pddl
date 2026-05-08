(define (domain obfuscated_deceptive_logistics_40)
  (:requirements :strips :typing)
  (:types
    hand cats sneeze stupendous texture - object
    spring - texture
  )
  (:predicates
    (next ?obj - object ?loc - texture)
    (vase ?h - hand ?vessel - object)
    (collect ?t - texture ?s - stupendous)
  )

  (:action paltry
    :parameters (?obj_0 - hand ?obj_1 - cats ?obj_2 - texture)
    :precondition (and (vase ?obj_0 ?obj_1) (next ?obj_1 ?obj_2))
    :effect (and (next ?obj_0 ?obj_2) (not (vase ?obj_0 ?obj_1)))
  )

  (:action sip
    :parameters (?obj_0 - hand ?obj_1 - cats ?obj_2 - texture)
    :precondition (and (next ?obj_0 ?obj_2) (next ?obj_1 ?obj_2))
    :effect (and (vase ?obj_0 ?obj_1) (not (next ?obj_0 ?obj_2)))
  )

  (:action clip
    :parameters (?obj_0 - hand ?obj_1 - sneeze ?obj_2 - texture)
    :precondition (and (next ?obj_1 ?obj_2) (next ?obj_0 ?obj_2))
    :effect (and (vase ?obj_0 ?obj_1) (not (next ?obj_0 ?obj_2)))
  )

  (:action wretched
    :parameters (?obj_0 - sneeze ?obj_1 - texture ?obj_2 - texture ?obj_3 - stupendous)
    :precondition (and (next ?obj_0 ?obj_1) (collect ?obj_1 ?obj_3) (collect ?obj_2 ?obj_3))
    :effect (and (next ?obj_0 ?obj_2) (not (next ?obj_0 ?obj_1)))
  )

  (:action memory
    :parameters (?obj_0 - cats ?obj_1 - spring ?obj_2 - spring)
    :precondition (next ?obj_0 ?obj_1)
    :effect (and (next ?obj_0 ?obj_2) (not (next ?obj_0 ?obj_1)))
  )

  (:action tightfisted
    :parameters (?obj_0 - hand ?obj_1 - sneeze ?obj_2 - texture)
    :precondition (and (next ?obj_1 ?obj_2) (vase ?obj_0 ?obj_1))
    :effect (and (next ?obj_0 ?obj_2) (not (vase ?obj_0 ?obj_1)))
  )
)