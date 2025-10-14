(define (domain depots24)
  (:requirements :typing :negative-preconditions)
  (:types obj)
  (:predicates
    (hand ?o - obj)
    (cats ?o - obj)
    (texture ?o - obj)
    (vase ?o - obj)
    (next ?a - obj ?b - obj)
    (sneeze ?o - obj)
    (stupendous ?o - obj)
    (collect ?a - obj ?b - obj)
    (spring ?o - obj)
  )

  (:action p1-clip
    :parameters (?a - obj ?b - obj)
    :precondition (and (hand ?a))
    :effect (and (next ?a ?b))
  )

  (:action p1-wretched
    :parameters (?a - obj ?b - obj ?c - obj ?d - obj)
    :precondition (and (collect ?a ?b))
    :effect (and (next ?c ?d))
  )

  (:action p1-tightfisted
    :parameters (?a - obj ?b - obj ?c - obj)
    :precondition (and (texture ?a))
    :effect (and (next ?b ?c))
  )

  (:action p1-memory
    :parameters (?a - obj ?b - obj ?c - obj)
    :precondition (and (stupendous ?a))
    :effect (and (next ?b ?c))
  )

  (:action p1-sip
    :parameters (?a - obj ?b - obj ?c - obj)
    :precondition (and (sneeze ?a))
    :effect (and (next ?b ?c))
  )

  (:action p1-paltry
    :parameters (?a - obj ?b - obj)
    :precondition (and (spring ?a))
    :effect (and (next ?a ?b))
  )

  ;; Player 2 namespaced actions (kept distinct from player1)
  (:action p2-clip
    :parameters (?a - obj ?b - obj)
    :precondition (and (hand ?a))
    :effect (and (next ?a ?b))
  )

  (:action p2-wretched
    :parameters (?a - obj ?b - obj ?c - obj ?d - obj)
    :precondition (and (collect ?a ?b))
    :effect (and (next ?c ?d))
  )

  (:action p2-tightfisted
    :parameters (?a - obj ?b - obj ?c - obj)
    :precondition (and (texture ?a))
    :effect (and (next ?b ?c))
  )

  (:action p2-memory
    :parameters (?a - obj ?b - obj ?c - obj)
    :precondition (and (stupendous ?a))
    :effect (and (next ?b ?c))
  )

  (:action p2-sip
    :parameters (?a - obj ?b - obj ?c - obj)
    :precondition (and (sneeze ?a))
    :effect (and (next ?b ?c))
  )

  (:action p2-paltry
    :parameters (?a - obj ?b - obj)
    :precondition (and (spring ?a))
    :effect (and (next ?a ?b))
  )
)