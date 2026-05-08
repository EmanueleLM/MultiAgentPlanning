(define (domain obfuscated-deceptive-logistics-17)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    obj
    stage
  )

  (:predicates
    (hand ?o - obj)
    (cats ?o - obj)
    (texture ?o - obj)
    (vase ?h - obj ?c - obj)
    (next ?o - obj ?t - obj)
    (sneeze ?o - obj)
    (stupendous ?o - obj)
    (collect ?a - obj ?b - obj)
    (spring ?o - obj)

    ;; Explicit discrete-time / stage modeling
    (current-stage ?s - stage)
    (succ ?s - stage ?s2 - stage)
  )

  ;; Each action must be executed at the current stage and advances to the unique successor stage.
  ;; This enforces explicit, contiguous stage progression (no bookkeeping shortcuts).
  (:action paltry
    :parameters (?h - obj ?c - obj ?t - obj ?st - stage ?st2 - stage)
    :precondition (and
      (hand ?h)
      (cats ?c)
      (texture ?t)
      (vase ?h ?c)
      (next ?c ?t)
      (current-stage ?st)
      (succ ?st ?st2)
    )
    :effect (and
      (next ?h ?t)
      (not (vase ?h ?c))
      (not (current-stage ?st))
      (current-stage ?st2)
    )
  )

  (:action sip
    :parameters (?h - obj ?c - obj ?t - obj ?st - stage ?st2 - stage)
    :precondition (and
      (hand ?h)
      (cats ?c)
      (texture ?t)
      (next ?h ?t)
      (next ?c ?t)
      (current-stage ?st)
      (succ ?st ?st2)
    )
    :effect (and
      (vase ?h ?c)
      (not (next ?h ?t))
      (not (current-stage ?st))
      (current-stage ?st2)
    )
  )

  (:action clip
    :parameters (?h - obj ?sn - obj ?t - obj ?st - stage ?st2 - stage)
    :precondition (and
      (hand ?h)
      (sneeze ?sn)
      (texture ?t)
      (next ?sn ?t)
      (next ?h ?t)
      (current-stage ?st)
      (succ ?st ?st2)
    )
    :effect (and
      (vase ?h ?sn)
      (not (next ?h ?t))
      (not (current-stage ?st))
      (current-stage ?st2)
    )
  )

  (:action wretched
    :parameters (?sn - obj ?t1 - obj ?t2 - obj ?stp - obj ?st - stage ?st2 - stage)
    :precondition (and
      (sneeze ?sn)
      (texture ?t1)
      (texture ?t2)
      (stupendous ?stp)
      (next ?sn ?t1)
      (collect ?t1 ?stp)
      (collect ?t2 ?stp)
      (current-stage ?st)
      (succ ?st ?st2)
    )
    :effect (and
      (next ?sn ?t2)
      (not (next ?sn ?t1))
      (not (current-stage ?st))
      (current-stage ?st2)
    )
  )

  (:action memory
    :parameters (?c - obj ?sp1 - obj ?sp2 - obj ?st - stage ?st2 - stage)
    :precondition (and
      (cats ?c)
      (spring ?sp1)
      (spring ?sp2)
      (next ?c ?sp1)
      (current-stage ?st)
      (succ ?st ?st2)
    )
    :effect (and
      (next ?c ?sp2)
      (not (next ?c ?sp1))
      (not (current-stage ?st))
      (current-stage ?st2)
    )
  )

  (:action tightfisted
    :parameters (?h - obj ?sn - obj ?t - obj ?st - stage ?st2 - stage)
    :precondition (and
      (hand ?h)
      (sneeze ?sn)
      (texture ?t)
      (next ?sn ?t)
      (vase ?h ?sn)
      (current-stage ?st)
      (succ ?st ?st2)
    )
    :effect (and
      (next ?h ?t)
      (not (vase ?h ?sn))
      (not (current-stage ?st))
      (current-stage ?st2)
    )
  )
)