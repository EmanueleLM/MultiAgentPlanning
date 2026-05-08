(define (domain obfuscated_deceptive_logistics_30)
  (:requirements :strips :typing :negative-preconditions)
  (:types object)
  (:predicates
    (hand ?o - object)
    (cats ?o - object)
    (sneeze ?o - object)
    (texture ?o - object)
    (stupendous ?o - object)
    (spring ?o - object)
    (next ?o1 - object ?o2 - object)
    (vase ?o1 - object ?o2 - object)
    (collect ?o1 - object ?o2 - object)
  )

  (:action paltry
    :parameters (?v - object ?p - object ?l - object)
    :precondition (and (hand ?v) (cats ?p) (texture ?l) (vase ?v ?p) (next ?p ?l))
    :effect (and (next ?v ?l) (not (vase ?v ?p)))
  )

  (:action sip
    :parameters (?v - object ?p - object ?l - object)
    :precondition (and (hand ?v) (cats ?p) (texture ?l) (next ?v ?l) (next ?p ?l))
    :effect (and (vase ?v ?p) (not (next ?v ?l)))
  )

  (:action clip
    :parameters (?v - object ?p - object ?l - object)
    :precondition (and (hand ?v) (sneeze ?p) (texture ?l) (next ?p ?l) (next ?v ?l))
    :effect (and (vase ?v ?p) (not (next ?v ?l)))
  )

  (:action wretched
    :parameters (?p - object ?l1 - object ?l2 - object ?r - object)
    :precondition (and (sneeze ?p) (texture ?l1) (texture ?l2) (stupendous ?r) (next ?p ?l1) (collect ?l1 ?r) (collect ?l2 ?r))
    :effect (and (next ?p ?l2) (not (next ?p ?l1)))
  )

  (:action memory
    :parameters (?p - object ?l1 - object ?l2 - object)
    :precondition (and (cats ?p) (spring ?l1) (spring ?l2) (next ?p ?l1))
    :effect (and (next ?p ?l2) (not (next ?p ?l1)))
  )

  (:action tightfisted
    :parameters (?v - object ?p - object ?l - object)
    :precondition (and (hand ?v) (sneeze ?p) (texture ?l) (next ?p ?l) (vase ?v ?p))
    :effect (and (next ?v ?l) (not (vase ?v ?p)))
  )
)