(define (domain Logistics13)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj stage)

  (:predicates
    (hand ?x - obj)
    (cats ?x - obj)
    (sneeze ?x - obj)
    (stupendous ?x - obj)
    (texture ?x - obj)
    (spring ?x - obj)
    (vase ?x - obj ?y - obj)
    (next ?x - obj ?y - obj)
    (collect ?x - obj ?y - obj)
    ;; explicit discrete stage/time model to enforce ordered, contiguous progression
    (at-stage ?x - obj ?s - stage)
    (succ ?s1 - stage ?s2 - stage)
  )

  ;; each action requires the primary subject ?x to be at some stage ?t and moves it
  ;; to the immediate successor stage ?t2. This enforces contiguous occupancy and
  ;; an explicit ordering of action occurrences.
  (:action paltry
    :parameters (?x - obj ?y - obj ?z - obj ?t - stage ?t2 - stage)
    :precondition (and
      (hand ?x)
      (cats ?y)
      (texture ?z)
      (vase ?x ?y)
      (next ?y ?z)
      (at-stage ?x ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (next ?x ?z)
      (not (vase ?x ?y))
      (not (at-stage ?x ?t))
      (at-stage ?x ?t2)
    )
  )

  (:action sip
    :parameters (?x - obj ?y - obj ?z - obj ?t - stage ?t2 - stage)
    :precondition (and
      (hand ?x)
      (cats ?y)
      (texture ?z)
      (next ?x ?z)
      (next ?y ?z)
      (at-stage ?x ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (vase ?x ?y)
      (not (next ?x ?z))
      (not (at-stage ?x ?t))
      (at-stage ?x ?t2)
    )
  )

  (:action clip
    :parameters (?x - obj ?y - obj ?z - obj ?t - stage ?t2 - stage)
    :precondition (and
      (hand ?x)
      (sneeze ?y)
      (texture ?z)
      (next ?y ?z)
      (next ?x ?z)
      (at-stage ?x ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (vase ?x ?y)
      (not (next ?x ?z))
      (not (at-stage ?x ?t))
      (at-stage ?x ?t2)
    )
  )

  (:action wretched
    :parameters (?x - obj ?y - obj ?z - obj ?w - obj ?t - stage ?t2 - stage)
    :precondition (and
      (sneeze ?x)
      (texture ?y)
      (texture ?z)
      (stupendous ?w)
      (next ?x ?y)
      (collect ?y ?w)
      (collect ?z ?w)
      (at-stage ?x ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (next ?x ?z)
      (not (next ?x ?y))
      (not (at-stage ?x ?t))
      (at-stage ?x ?t2)
    )
  )

  (:action memory
    :parameters (?x - obj ?y - obj ?z - obj ?t - stage ?t2 - stage)
    :precondition (and
      (cats ?x)
      (spring ?y)
      (spring ?z)
      (next ?x ?y)
      (at-stage ?x ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (next ?x ?z)
      (not (next ?x ?y))
      (not (at-stage ?x ?t))
      (at-stage ?x ?t2)
    )
  )

  (:action tightfisted
    :parameters (?x - obj ?y - obj ?z - obj ?t - stage ?t2 - stage)
    :precondition (and
      (hand ?x)
      (sneeze ?y)
      (texture ?z)
      (next ?y ?z)
      (vase ?x ?y)
      (at-stage ?x ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (next ?x ?z)
      (not (vase ?x ?y))
      (not (at-stage ?x ?t))
      (at-stage ?x ?t2)
    )
  )
)