(define (domain obfuscated_deceptive_logistics_36)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)
  (:predicates
    (hand ?o)
    (cats ?o)
    (texture ?o)
    (sneeze ?o)
    (stupendous ?o)
    (spring ?o)
    (vase ?v ?c)
    (next ?x ?y)
    (collect ?l ?r)
  )

  (:action paltry
    :parameters (?v ?c ?l - obj)
    :precondition (and (hand ?v) (cats ?c) (texture ?l) (vase ?v ?c) (next ?c ?l))
    :effect (and (next ?v ?l) (not (vase ?v ?c)))
  )

  (:action sip
    :parameters (?v ?c ?l - obj)
    :precondition (and (hand ?v) (cats ?c) (texture ?l) (next ?v ?l) (next ?c ?l))
    :effect (and (vase ?v ?c) (not (next ?v ?l)))
  )

  (:action clip
    :parameters (?v ?c ?l - obj)
    :precondition (and (hand ?v) (sneeze ?c) (texture ?l) (next ?c ?l) (next ?v ?l))
    :effect (and (vase ?v ?c) (not (next ?v ?l)))
  )

  (:action wretched
    :parameters (?c ?l1 ?l2 ?r - obj)
    :precondition (and (sneeze ?c) (texture ?l1) (texture ?l2) (stupendous ?r) (next ?c ?l1) (collect ?l1 ?r) (collect ?l2 ?r))
    :effect (and (next ?c ?l2) (not (next ?c ?l1)))
  )

  (:action memory
    :parameters (?c ?s1 ?s2 - obj)
    :precondition (and (cats ?c) (spring ?s1) (spring ?s2) (next ?c ?s1))
    :effect (and (next ?c ?s2) (not (next ?c ?s1)))
  )

  (:action tightfisted
    :parameters (?v ?c ?l - obj)
    :precondition (and (hand ?v) (sneeze ?c) (texture ?l) (next ?c ?l) (vase ?v ?c))
    :effect (and (next ?v ?l) (not (vase ?v ?c)))
  )
)