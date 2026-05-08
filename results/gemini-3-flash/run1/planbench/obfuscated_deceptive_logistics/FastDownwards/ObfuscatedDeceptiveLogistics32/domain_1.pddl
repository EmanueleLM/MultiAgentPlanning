(define (domain obfuscated_deceptive_logistics_32)
  (:requirements :strips :typing)
  (:types
    hand_t cats_t sneeze_t stupendous_t texture_t - object
    spring_t - texture_t
  )

  (:predicates
    (hand ?o - object)
    (cats ?o - object)
    (sneeze ?o - object)
    (texture ?o - object)
    (spring ?o - object)
    (stupendous ?o - object)
    (next ?o1 - object ?o2 - object)
    (vase ?o1 - object ?o2 - object)
    (collect ?o1 - object ?o2 - object)
  )

  (:action paltry
    :parameters (?v - hand_t ?h - cats_t ?l - texture_t)
    :precondition (and (hand ?v) (cats ?h) (texture ?l) (vase ?v ?h) (next ?h ?l))
    :effect (and (next ?v ?l) (not (vase ?v ?h)))
  )

  (:action sip
    :parameters (?v - hand_t ?h - cats_t ?l - texture_t)
    :precondition (and (hand ?v) (cats ?h) (texture ?l) (next ?v ?l) (next ?h ?l))
    :effect (and (vase ?v ?h) (not (next ?v ?l)))
  )

  (:action clip
    :parameters (?v - hand_t ?h - sneeze_t ?l - texture_t)
    :precondition (and (hand ?v) (sneeze ?h) (texture ?l) (next ?h ?l) (next ?v ?l))
    :effect (and (vase ?v ?h) (not (next ?v ?l)))
  )

  (:action wretched
    :parameters (?h - sneeze_t ?l1 - texture_t ?l2 - texture_t ?z - stupendous_t)
    :precondition (and (sneeze ?h) (texture ?l1) (texture ?l2) (stupendous ?z) (next ?h ?l1) (collect ?l1 ?z) (collect ?l2 ?z))
    :effect (and (next ?h ?l2) (not (next ?h ?l1)))
  )

  (:action memory
    :parameters (?h - cats_t ?l1 - spring_t ?l2 - spring_t)
    :precondition (and (cats ?h) (spring ?l1) (spring ?l2) (next ?h ?l1))
    :effect (and (next ?h ?l2) (not (next ?h ?l1)))
  )

  (:action tightfisted
    :parameters (?v - hand_t ?h - sneeze_t ?l - texture_t)
    :precondition (and (hand ?v) (sneeze ?h) (texture ?l) (next ?h ?l) (vase ?v ?h))
    :effect (and (next ?v ?l) (not (vase ?v ?h)))
  )
)