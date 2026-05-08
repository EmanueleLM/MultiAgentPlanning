(define (domain obfuscated_deceptive_logistics_35)
  (:requirements :strips :typing)
  (:types obj)
  (:predicates
    (hand ?o - obj)
    (cats ?o - obj)
    (sneeze ?o - obj)
    (texture ?o - obj)
    (stupendous ?o - obj)
    (spring ?o - obj)
    (vase ?p ?v - obj)
    (next ?x ?l - obj)
    (collect ?l ?r - obj)
  )

  (:action paltry
    :parameters (?p - obj ?v - obj ?l - obj)
    :precondition (and (hand ?p) (cats ?v) (texture ?l) (vase ?p ?v) (next ?v ?l))
    :effect (and (next ?p ?l) (not (vase ?p ?v)))
  )

  (:action sip
    :parameters (?p - obj ?v - obj ?l - obj)
    :precondition (and (hand ?p) (cats ?v) (texture ?l) (next ?p ?l) (next ?v ?l))
    :effect (and (vase ?p ?v) (not (next ?p ?l)))
  )

  (:action clip
    :parameters (?p - obj ?v - obj ?l - obj)
    :precondition (and (hand ?p) (sneeze ?v) (texture ?l) (next ?v ?l) (next ?p ?l))
    :effect (and (vase ?p ?v) (not (next ?p ?l)))
  )

  (:action wretched
    :parameters (?v - obj ?l1 - obj ?l2 - obj ?r - obj)
    :precondition (and (sneeze ?v) (texture ?l1) (texture ?l2) (stupendous ?r) (next ?v ?l1) (collect ?l1 ?r) (collect ?l2 ?r))
    :effect (and (next ?v ?l2) (not (next ?v ?l1)))
  )

  (:action memory
    :parameters (?v - obj ?l1 - obj ?l2 - obj)
    :precondition (and (cats ?v) (spring ?l1) (spring ?l2) (next ?v ?l1))
    :effect (and (next ?v ?l2) (not (next ?v ?l1)))
  )

  (:action tightfisted
    :parameters (?p - obj ?v - obj ?l - obj)
    :precondition (and (hand ?p) (sneeze ?v) (texture ?l) (next ?v ?l) (vase ?p ?v))
    :effect (and (next ?p ?l) (not (vase ?p ?v)))
  )
)