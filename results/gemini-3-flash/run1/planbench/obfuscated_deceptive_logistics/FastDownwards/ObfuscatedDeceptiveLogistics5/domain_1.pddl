(define (domain obfuscated_deceptive_logistics_5)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)
  (:predicates
    (hand ?o - obj)
    (cats ?o - obj)
    (sneeze ?o - obj)
    (texture ?o - obj)
    (spring ?o - obj)
    (stupendous ?o - obj)
    (vase ?v - obj ?p - obj)
    (next ?o1 - obj ?o2 - obj)
    (collect ?o1 - obj ?o2 - obj)
  )

  (:action paltry
    :parameters (?v - obj ?p - obj ?l - obj)
    :precondition (and (hand ?v) (cats ?p) (texture ?l) (vase ?v ?p) (next ?p ?l))
    :effect (and (next ?v ?l) (not (vase ?v ?p)))
  )

  (:action sip
    :parameters (?v - obj ?p - obj ?l - obj)
    :precondition (and (hand ?v) (cats ?p) (texture ?l) (next ?v ?l) (next ?p ?l))
    :effect (and (vase ?v ?p) (not (next ?v ?l)))
  )

  (:action clip
    :parameters (?v - obj ?p - obj ?l - obj)
    :precondition (and (hand ?v) (sneeze ?p) (texture ?l) (next ?p ?l) (next ?v ?l))
    :effect (and (vase ?v ?p) (not (next ?v ?l)))
  )

  (:action wretched
    :parameters (?p - obj ?l1 - obj ?l2 - obj ?s - obj)
    :precondition (and (sneeze ?p) (texture ?l1) (texture ?l2) (stupendous ?s) (next ?p ?l1) (collect ?l1 ?s) (collect ?l2 ?s))
    :effect (and (next ?p ?l2) (not (next ?p ?l1)))
  )

  (:action memory
    :parameters (?p - obj ?l1 - obj ?l2 - obj)
    :precondition (and (cats ?p) (spring ?l1) (spring ?l2) (next ?p ?l1))
    :effect (and (next ?p ?l2) (not (next ?p ?l1)))
  )

  (:action tightfisted
    :parameters (?v - obj ?p - obj ?l - obj)
    :precondition (and (hand ?v) (sneeze ?p) (texture ?l) (next ?p ?l) (vase ?v ?p))
    :effect (and (next ?v ?l) (not (vase ?v ?p)))
  )
)