(define (domain orchestrated)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)

  (:predicates
    (hand ?x - obj ?y - obj)
    (cats ?x - obj ?y - obj)
    (texture ?x - obj ?y - obj)
    (vase ?x - obj ?y - obj)
    (next ?x - obj ?y - obj)
    (sneeze ?x - obj)
    (stupendous ?x - obj)
    (collect ?x - obj ?y - obj)
    (spring ?x - obj ?y - obj)
  )

  ;; Actions authored/validated by player_a (namespaced as pa-*)
  (:action pa-paltry
    :parameters (?a - obj ?b - obj ?c - obj)
    :precondition (and
      (hand ?a ?b)
      (cats ?b ?c)
      (texture ?c ?a)
    )
    :effect (and
      (vase ?b ?c)
      (next ?a ?c)
      (not (hand ?a ?b))
    )
  )

  (:action pa-sip
    :parameters (?a - obj ?b - obj ?c - obj)
    :precondition (and
      (hand ?a ?b)
      (texture ?b ?c)
    )
    :effect (and
      (next ?b ?c)
      (vase ?a ?c)
      (not (texture ?b ?c))
    )
  )

  (:action pa-clip
    :parameters (?a - obj ?b - obj ?c - obj)
    :precondition (and
      (cats ?a ?b)
      (hand ?b ?c)
    )
    :effect (and
      (vase ?a ?c)
      (next ?b ?c)
      (not (hand ?b ?c))
    )
  )

  (:action pa-tightfisted
    :parameters (?a - obj ?b - obj ?c - obj)
    :precondition (and
      (hand ?a ?b)
      (cats ?b ?c)
      (texture ?c ?b)
    )
    :effect (and
      (vase ?a ?b)
      (next ?a ?c)
      (not (cats ?b ?c))
    )
  )

  ;; Actions authored/validated by player_b (namespaced as pb-*)
  (:action pb-wretched
    :parameters (?s - obj ?t - obj ?u - obj ?v - obj)
    :precondition (and
      (sneeze ?s)
      (texture ?t ?u)
      (stupendous ?v)
      (collect ?u ?v)
    )
    :effect (and
      (next ?t ?v)
      (vase ?u ?v)
      (not (texture ?t ?u))
    )
  )

  (:action pb-memory
    :parameters (?x - obj ?y - obj ?z - obj)
    :precondition (and
      (cats ?x ?y)
      (spring ?y ?z)
    )
    :effect (and
      (next ?x ?z)
      (vase ?y ?z)
    )
  )
)