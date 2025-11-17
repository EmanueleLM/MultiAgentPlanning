(define (domain Logistics17)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj stage)

  (:predicates
    (cats ?o - obj)
    (hand ?o - obj)
    (sneeze ?o - obj)
    (spring ?o - obj)
    (stupendous ?o - obj)
    (texture ?o - obj)
    (vase ?x - obj ?y - obj)
    (next ?x - obj ?y - obj)
    (collect ?x - obj ?y - obj)
    (has-next ?o - obj)
    (current-stage ?s - stage)
    (succ ?s - stage ?s2 - stage)
  )

  ;; Discrete single-action-per-stage enforcement:
  ;; every action requires the current-stage and an explicit successor,
  ;; and advances current-stage to that successor. This enforces contiguous
  ;; scheduling and forbids oscillation or simultaneous actions.

  (:action paltry
    :parameters (?h - obj ?c - obj ?t - obj ?s - stage ?s2 - stage)
    :precondition (and
      (hand ?h)
      (cats ?c)
      (texture ?t)
      (vase ?h ?c)
      (next ?c ?t)
      (has-next ?c)
      (not (has-next ?h))
      (current-stage ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (next ?h ?t)
      (has-next ?h)
      (not (vase ?h ?c))
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  (:action sip
    :parameters (?h - obj ?c - obj ?t - obj ?s - stage ?s2 - stage)
    :precondition (and
      (hand ?h)
      (cats ?c)
      (texture ?t)
      (next ?h ?t)
      (next ?c ?t)
      (has-next ?h)
      (has-next ?c)
      (current-stage ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (vase ?h ?c)
      (not (next ?h ?t))
      (not (has-next ?h))
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  (:action clip
    :parameters (?h - obj ?sneeze - obj ?t - obj ?s - stage ?s2 - stage)
    :precondition (and
      (hand ?h)
      (sneeze ?sneeze)
      (texture ?t)
      (next ?sneeze ?t)
      (next ?h ?t)
      (has-next ?sneeze)
      (has-next ?h)
      (current-stage ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (vase ?h ?sneeze)
      (not (next ?h ?t))
      (not (has-next ?h))
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )

  (:action wretched
    :parameters (?s - obj ?t1 - obj ?t2 - obj ?st - obj ?s1 - stage ?s2 - stage)
    :precondition (and
      (sneeze ?s)
      (texture ?t1)
      (texture ?t2)
      (stupendous ?st)
      (next ?s ?t1)
      (has-next ?s)
      (collect ?t1 ?st)
      (collect ?t2 ?st)
      (current-stage ?s1)
      (succ ?s1 ?s2)
    )
    :effect (and
      (next ?s ?t2)
      (not (next ?s ?t1))
      ;; has-next for ?s remains true (occupancy preserved while target changes)
      (not (current-stage ?s1))
      (current-stage ?s2)
    )
  )

  (:action memory
    :parameters (?c - obj ?s1 - obj ?s2 - obj ?stg - stage ?stg2 - stage)
    :precondition (and
      (cats ?c)
      (spring ?s1)
      (spring ?s2)
      (next ?c ?s1)
      (has-next ?c)
      (current-stage ?stg)
      (succ ?stg ?stg2)
    )
    :effect (and
      (next ?c ?s2)
      (not (next ?c ?s1))
      ;; has-next for ?c remains true
      (not (current-stage ?stg))
      (current-stage ?stg2)
    )
  )

  (:action tightfisted
    :parameters (?h - obj ?sneeze - obj ?t - obj ?s - stage ?s2 - stage)
    :precondition (and
      (hand ?h)
      (sneeze ?sneeze)
      (texture ?t)
      (next ?sneeze ?t)
      (has-next ?sneeze)
      (vase ?h ?sneeze)
      (not (has-next ?h))
      (current-stage ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (next ?h ?t)
      (has-next ?h)
      (not (vase ?h ?sneeze))
      (not (current-stage ?s))
      (current-stage ?s2)
    )
  )
)