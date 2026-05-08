(define (domain obfuscated_deceptive_logistics_37)
  (:requirements :strips :typing)
  (:types
    vehicle package location region - object
    cats_package sneeze_package - package
  )
  (:predicates
    (hand ?v - vehicle)
    (cats ?p - cats_package)
    (sneeze ?p - sneeze_package)
    (texture ?l - location)
    (spring ?l - location)
    (stupendous ?r - region)
    (collect ?l - location ?r - region)
    (next ?obj - object ?l - location)
    (vase ?v - vehicle ?p - package)
  )

  (:action paltry
    :parameters (?v - vehicle ?p - cats_package ?l - location)
    :precondition (and (hand ?v) (cats ?p) (texture ?l) (vase ?v ?p) (next ?p ?l))
    :effect (and (next ?v ?l) (not (vase ?v ?p)))
  )

  (:action sip
    :parameters (?v - vehicle ?p - cats_package ?l - location)
    :precondition (and (hand ?v) (cats ?p) (texture ?l) (next ?v ?l) (next ?p ?l))
    :effect (and (vase ?v ?p) (not (next ?v ?l)))
  )

  (:action clip
    :parameters (?v - vehicle ?p - sneeze_package ?l - location)
    :precondition (and (hand ?v) (sneeze ?p) (texture ?l) (next ?p ?l) (next ?v ?l))
    :effect (and (vase ?v ?p) (not (next ?v ?l)))
  )

  (:action wretched
    :parameters (?p - sneeze_package ?l1 - location ?l2 - location ?r - region)
    :precondition (and (sneeze ?p) (texture ?l1) (texture ?l2) (stupendous ?r) (next ?p ?l1) (collect ?l1 ?r) (collect ?l2 ?r))
    :effect (and (next ?p ?l2) (not (next ?p ?l1)))
  )

  (:action memory
    :parameters (?p - cats_package ?l1 - location ?l2 - location)
    :precondition (and (cats ?p) (spring ?l1) (spring ?l2) (next ?p ?l1))
    :effect (and (next ?p ?l2) (not (next ?p ?l1)))
  )

  (:action tightfisted
    :parameters (?v - vehicle ?p - sneeze_package ?l - location)
    :precondition (and (hand ?v) (sneeze ?p) (texture ?l) (next ?p ?l) (vase ?v ?p))
    :effect (and (next ?v ?l) (not (vase ?v ?p)))
  )
)