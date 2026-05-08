(define (domain obfuscated_deceptive_logistics_36)
  (:requirements :strips :typing)
  (:types
    locatable texture stupendous - object
    hand - locatable
    vehicle - locatable
    cats sneeze - vehicle
  )

  (:predicates
    (next ?obj - locatable ?loc - texture)
    (vase ?pkg - hand ?veh - vehicle)
    (collect ?loc - texture ?city - stupendous)
    (spring ?loc - texture)
  )

  (:action paltry
    :parameters (?o0 - hand ?o1 - cats ?o2 - texture)
    :precondition (and (vase ?o0 ?o1) (next ?o1 ?o2))
    :effect (and (next ?o0 ?o2) (not (vase ?o0 ?o1)))
  )

  (:action sip
    :parameters (?o0 - hand ?o1 - cats ?o2 - texture)
    :precondition (and (next ?o0 ?o2) (next ?o1 ?o2))
    :effect (and (vase ?o0 ?o1) (not (next ?o0 ?o2)))
  )

  (:action clip
    :parameters (?o0 - hand ?o1 - sneeze ?o2 - texture)
    :precondition (and (next ?o1 ?o2) (next ?o0 ?o2))
    :effect (and (vase ?o0 ?o1) (not (next ?o0 ?o2)))
  )

  (:action tightfisted
    :parameters (?o0 - hand ?o1 - sneeze ?o2 - texture)
    :precondition (and (next ?o1 ?o2) (vase ?o0 ?o1))
    :effect (and (next ?o0 ?o2) (not (vase ?o0 ?o1)))
  )

  (:action wretched
    :parameters (?o0 - sneeze ?o1 - texture ?o2 - texture ?o3 - stupendous)
    :precondition (and (next ?o0 ?o1) (collect ?o1 ?o3) (collect ?o2 ?o3))
    :effect (and (next ?o0 ?o2) (not (next ?o0 ?o1)))
  )

  (:action memory
    :parameters (?o0 - cats ?o1 - texture ?o2 - texture)
    :precondition (and (spring ?o1) (spring ?o2) (next ?o0 ?o1))
    :effect (and (next ?o0 ?o2) (not (next ?o0 ?o1)))
  )
)