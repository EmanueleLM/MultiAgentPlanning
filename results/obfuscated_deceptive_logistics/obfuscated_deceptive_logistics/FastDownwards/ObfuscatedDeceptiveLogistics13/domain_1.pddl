(define (domain orchestrated)
  (:requirements :typing :negative-preconditions)
  (:types agent obj loc cat tex)
  (:predicates
    (hand ?a - agent ?o - obj)
    (cats ?c - cat)
    (texture ?o - obj ?t - tex)
    (vase ?o - obj)
    (next ?l1 - loc ?l2 - loc)
    (sneeze ?a - agent)
    (spring)
    (collect ?a - agent ?o - obj)
    (stupendous ?o - obj)
    (at-agent ?a - agent ?l - loc)
    (at-obj ?o - obj ?l - loc)
    (available ?o - obj)
    (can_collect ?a - agent)
    (remembered ?a - agent ?o - obj)
    (tightfisted ?a - agent)
  )

  (:action paltry
    :parameters (?a - agent ?o - obj ?l - loc)
    :precondition (and (at-agent ?a ?l) (at-obj ?o ?l) (vase ?o) (available ?o) (can_collect ?a))
    :effect (and
      (collect ?a ?o)
      (hand ?a ?o)
      (stupendous ?o)
      (not (available ?o))
      (not (at-obj ?o ?l))
    )
  )

  (:action sip
    :parameters (?a - agent ?o - obj ?t - tex)
    :precondition (and (hand ?a ?o) (texture ?o ?t))
    :effect (and (sneeze ?a))
  )

  (:action clip
    :parameters (?a - agent ?from - loc ?to - loc)
    :precondition (and (at-agent ?a ?from) (next ?from ?to))
    :effect (and (at-agent ?a ?to) (not (at-agent ?a ?from)))
  )

  (:action wretched
    :parameters (?a - agent ?o - obj ?l - loc)
    :precondition (and (hand ?a ?o) (at-agent ?a ?l))
    :effect (and
      (not (vase ?o))
      (not (stupendous ?o))
      (not (hand ?a ?o))
      (at-obj ?o ?l)
      (not (available ?o))
    )
  )

  (:action memory
    :parameters (?a - agent ?o - obj)
    :precondition (and (collect ?a ?o))
    :effect (and (remembered ?a ?o))
  )

  (:action tightfisted
    :parameters (?a - agent)
    :precondition (and)
    :effect (and (tightfisted ?a) (not (can_collect ?a)))
  )
)