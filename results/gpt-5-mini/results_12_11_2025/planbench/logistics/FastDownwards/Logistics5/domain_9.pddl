(define (domain Logistics5)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)
  (:predicates
    (hand ?o - obj)
    (cats ?o - obj)
    (texture ?o - obj)
    (sneeze ?o - obj)
    (spring ?o - obj)
    (stupendous ?o - obj)
    (next ?o1 - obj ?o2 - obj)
    (vase ?o1 - obj ?o2 - obj)
    (collect ?o1 - obj ?o2 - obj)
  )

  (:action paltry
    :parameters (?x - obj ?y - obj ?z - obj)
    :precondition (and
      (hand ?x)
      (cats ?y)
      (texture ?z)
      (vase ?x ?y)
      (next ?y ?z))
    :effect (and
      (next ?x ?z)
      (not (vase ?x ?y)))
  )

  (:action sip
    :parameters (?x - obj ?y - obj ?z - obj)
    :precondition (and
      (hand ?x)
      (cats ?y)
      (texture ?z)
      (next ?x ?z)
      (next ?y ?z))
    :effect (and
      (vase ?x ?y)
      (not (next ?x ?z)))
  )

  (:action clip
    :parameters (?x - obj ?y - obj ?z - obj)
    :precondition (and
      (hand ?x)
      (sneeze ?y)
      (texture ?z)
      (next ?y ?z)
      (next ?x ?z))
    :effect (and
      (vase ?x ?y)
      (not (next ?x ?z)))
  )

  (:action wretched
    :parameters (?x - obj ?y - obj ?z - obj ?w - obj)
    :precondition (and
      (sneeze ?x)
      (texture ?y)
      (texture ?z)
      (stupendous ?w)
      (next ?x ?y)
      (collect ?y ?w)
      (collect ?z ?w))
    :effect (and
      (next ?x ?z)
      (not (next ?x ?y)))
  )

  (:action memory
    :parameters (?x - obj ?y - obj ?z - obj)
    :precondition (and
      (cats ?x)
      (spring ?y)
      (spring ?z)
      (next ?x ?y))
    :effect (and
      (next ?x ?z)
      (not (next ?x ?y)))
  )

  (:action tightfisted
    :parameters (?x - obj ?y - obj ?z - obj)
    :precondition (and
      (hand ?x)
      (sneeze ?y)
      (texture ?z)
      (next ?y ?z)
      (vase ?x ?y))
    :effect (and
      (next ?x ?z)
      (not (vase ?x ?y)))
  )
)