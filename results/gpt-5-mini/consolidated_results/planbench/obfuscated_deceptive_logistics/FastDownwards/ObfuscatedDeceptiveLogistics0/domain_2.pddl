(define (domain orchestrator)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj step)

  (:predicates
    (cats ?o - obj)
    (hand ?o - obj)
    (texture ?o - obj)
    (sneeze ?o - obj)
    (spring ?o - obj)
    (stupendous ?o - obj)
    (collect ?a ?b - obj)
    (next ?a ?b - obj)
    (vase ?x ?y - obj)

    ;; explicit discrete-stage/time modeling to enforce ordering and contiguous progression
    (now ?t - step)
    (succ ?t1 ?t2 - step)
  )

  ;; All actions must advance the global "now" along the succ chain.
  ;; This makes ordering explicit and prevents oscillation by using an acyclic succ relation.

  (:action sip
    :parameters (?x ?y ?z - obj ?t ?t2 - step)
    :precondition (and
      (now ?t)
      (succ ?t ?t2)
      (hand ?x)
      (cats ?y)
      (texture ?z)
      (next ?x ?z)
      (next ?y ?z)
    )
    :effect (and
      (vase ?x ?y)
      (not (next ?x ?z))
      (not (now ?t))
      (now ?t2)
    )
  )

  (:action clip
    :parameters (?x ?y ?z - obj ?t ?t2 - step)
    :precondition (and
      (now ?t)
      (succ ?t ?t2)
      (hand ?x)
      (sneeze ?y)
      (texture ?z)
      (next ?y ?z)
      (next ?x ?z)
    )
    :effect (and
      (vase ?x ?y)
      (not (next ?x ?z))
      (not (now ?t))
      (now ?t2)
    )
  )

  (:action paltry
    :parameters (?x ?y ?z - obj ?t ?t2 - step)
    :precondition (and
      (now ?t)
      (succ ?t ?t2)
      (hand ?x)
      (cats ?y)
      (texture ?z)
      (vase ?x ?y)
      (next ?y ?z)
    )
    :effect (and
      (next ?x ?z)
      (not (vase ?x ?y))
      (not (now ?t))
      (now ?t2)
    )
  )

  (:action tightfisted
    :parameters (?x ?y ?z - obj ?t ?t2 - step)
    :precondition (and
      (now ?t)
      (succ ?t ?t2)
      (hand ?x)
      (sneeze ?y)
      (texture ?z)
      (next ?y ?z)
      (vase ?x ?y)
    )
    :effect (and
      (next ?x ?z)
      (not (vase ?x ?y))
      (not (now ?t))
      (now ?t2)
    )
  )

  (:action memory
    :parameters (?x ?y ?z - obj ?t ?t2 - step)
    :precondition (and
      (now ?t)
      (succ ?t ?t2)
      (cats ?x)
      (spring ?y)
      (spring ?z)
      (next ?x ?y)
    )
    :effect (and
      (next ?x ?z)
      (not (next ?x ?y))
      (not (now ?t))
      (now ?t2)
    )
  )

  (:action wretched
    :parameters (?x ?y ?z ?w - obj ?t ?t2 - step)
    :precondition (and
      (now ?t)
      (succ ?t ?t2)
      (sneeze ?x)
      (texture ?y)
      (texture ?z)
      (stupendous ?w)
      (next ?x ?y)
      (collect ?y ?w)
      (collect ?z ?w)
    )
    :effect (and
      (next ?x ?z)
      (not (next ?x ?y))
      (not (now ?t))
      (now ?t2)
    )
  )
)