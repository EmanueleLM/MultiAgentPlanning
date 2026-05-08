(define (domain obfuscated_deceptive_logistics_28)
  (:requirements :strips :typing)
  (:types 
    hand cats sneeze stupendous texture - object
    spring - texture
  )

  (:predicates
    (hand ?h - hand)
    (cats ?c - cats)
    (sneeze ?s - sneeze)
    (texture ?t - texture)
    (spring ?sp - spring)
    (stupendous ?st - stupendous)
    (vase ?h - hand ?car - object)
    (next ?obj - object ?loc - texture)
    (collect ?loc - texture ?st - stupendous)
  )

  ;; paltry: Robot disembarks from cats carrier at a location.
  (:action paltry
    :parameters (?o0 - hand ?o1 - cats ?o2 - texture)
    :precondition (and (hand ?o0) (cats ?o1) (texture ?o2) (vase ?o0 ?o1) (next ?o1 ?o2))
    :effect (and (next ?o0 ?o2) (not (vase ?o0 ?o1)))
  )

  ;; sip: Robot boards cats carrier at its current location.
  (:action sip
    :parameters (?o0 - hand ?o1 - cats ?o2 - texture)
    :precondition (and (hand ?o0) (cats ?o1) (texture ?o2) (next ?o0 ?o2) (next ?o1 ?o2))
    :effect (and (vase ?o0 ?o1) (not (next ?o0 ?o2)))
  )

  ;; clip: Robot boards sneeze carrier at its current location.
  (:action clip
    :parameters (?o0 - hand ?o1 - sneeze ?o2 - texture)
    :precondition (and (hand ?o0) (sneeze ?o1) (texture ?o2) (next ?o1 ?o2) (next ?o0 ?o2))
    :effect (and (vase ?o0 ?o1) (not (next ?o0 ?o2)))
  )

  ;; wretched: Sneeze carrier moves between locations in the same stupendous region.
  (:action wretched
    :parameters (?o0 - sneeze ?o1 - texture ?o2 - texture ?o3 - stupendous)
    :precondition (and (sneeze ?o0) (texture ?o1) (texture ?o2) (stupendous ?o3) 
                       (next ?o0 ?o1) (collect ?o1 ?o3) (collect ?o2 ?o3))
    :effect (and (next ?o0 ?o2) (not (next ?o0 ?o1)))
  )

  ;; memory: Cats carrier moves between spring locations.
  (:action memory
    :parameters (?o0 - cats ?o1 - spring ?o2 - spring)
    :precondition (and (cats ?o0) (spring ?o1) (spring ?o2) (next ?o0 ?o1))
    :effect (and (next ?o0 ?o2) (not (next ?o0 ?o1)))
  )

  ;; tightfisted: Robot disembarks from sneeze carrier at a location.
  (:action tightfisted
    :parameters (?o0 - hand ?o1 - sneeze ?o2 - texture)
    :precondition (and (hand ?o0) (sneeze ?o1) (texture ?o2) (next ?o1 ?o2) (vase ?o0 ?o1))
    :effect (and (next ?o0 ?o2) (not (vase ?o0 ?o1)))
  )
)