(define (domain obfuscated_deceptive_logistics_40)
  (:requirements :strips :typing)
  (:types
    hand cats sneeze stupendous texture - object
    spring - texture
  )
  (:predicates
    (hand ?h - hand)
    (cats ?v - cats)
    (sneeze ?v - sneeze)
    (texture ?l - texture)
    (spring ?l - spring)
    (stupendous ?g - stupendous)
    (collect ?l - texture ?g - stupendous)
    (next ?o - object ?l - texture)
    (vase ?h - hand ?v - object)
  )

  (:action paltry
    :parameters (?h - hand ?v - cats ?l - texture)
    :precondition (and (hand ?h) (cats ?v) (texture ?l) (vase ?h ?v) (next ?v ?l))
    :effect (and (next ?h ?l) (not (vase ?h ?v)))
  )

  (:action sip
    :parameters (?h - hand ?v - cats ?l - texture)
    :precondition (and (hand ?h) (cats ?v) (texture ?l) (next ?h ?l) (next ?v ?l))
    :effect (and (vase ?h ?v) (not (next ?h ?l)))
  )

  (:action clip
    :parameters (?h - hand ?v - sneeze ?l - texture)
    :precondition (and (hand ?h) (sneeze ?v) (texture ?l) (next ?v ?l) (next ?h ?l))
    :effect (and (vase ?h ?v) (not (next ?h ?l)))
  )

  (:action wretched
    :parameters (?v - sneeze ?l1 - texture ?l2 - texture ?g - stupendous)
    :precondition (and (sneeze ?v) (texture ?l1) (texture ?l2) (stupendous ?g) (next ?v ?l1) (collect ?l1 ?g) (collect ?l2 ?g))
    :effect (and (next ?v ?l2) (not (next ?v ?l1)))
  )

  (:action memory
    :parameters (?v - cats ?l1 - spring ?l2 - spring)
    :precondition (and (cats ?v) (spring ?l1) (spring ?l2) (next ?v ?l1))
    :effect (and (next ?v ?l2) (not (next ?v ?l1)))
  )

  (:action tightfisted
    :parameters (?h - hand ?v - sneeze ?l - texture)
    :precondition (and (hand ?h) (sneeze ?v) (texture ?l) (next ?v ?l) (vase ?h ?v))
    :effect (and (next ?h ?l) (not (vase ?h ?v)))
  )
)