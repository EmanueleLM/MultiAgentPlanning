(define (domain objects-play)
  (:requirements :strips :typing :negative-preconditions)
  (:types object stage)

  (:predicates
    (hand ?o - object)
    (cats ?o - object)
    (texture ?o - object)
    (vase ?o1 - object ?o2 - object)
    (next ?o1 - object ?o2 - object)
    (sneeze ?o - object)
    (spring ?o - object)
    (stupendous ?o - object)
    (collect ?o1 - object ?o2 - object)

    ;; explicit discrete time / stage progression
    (current ?s - stage)
    (succ ?s1 - stage ?s2 - stage)
  )

  ;; Every action must be executed at a current stage and advances to an explicitly declared successor stage.
  ;; This enforces discrete, contiguous stage progression and prevents oscillating reapplication of the same predicates
  ;; within a single stage. The stage tokens are consumed (current) and produced (current successor) as part of each action.

  (:action paltry
    :parameters (?h - object ?c - object ?t - object ?s - stage ?s2 - stage)
    :precondition (and
      (hand ?h)
      (cats ?c)
      (texture ?t)
      (vase ?h ?c)
      (next ?c ?t)
      (current ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (next ?h ?t)
      (not (vase ?h ?c))
      ;; advance stage
      (not (current ?s))
      (current ?s2)
    )
  )

  (:action sip
    :parameters (?h - object ?c - object ?t - object ?s - stage ?s2 - stage)
    :precondition (and
      (hand ?h)
      (cats ?c)
      (texture ?t)
      (next ?h ?t)
      (next ?c ?t)
      (current ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (vase ?h ?c)
      (not (next ?h ?t))
      ;; advance stage
      (not (current ?s))
      (current ?s2)
    )
  )

  (:action clip
    :parameters (?h - object ?sn - object ?t - object ?s - stage ?s2 - stage)
    :precondition (and
      (hand ?h)
      (sneeze ?sn)
      (texture ?t)
      (next ?sn ?t)
      (next ?h ?t)
      (current ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (vase ?h ?sn)
      (not (next ?h ?t))
      ;; advance stage
      (not (current ?s))
      (current ?s2)
    )
  )

  (:action wretched
    :parameters (?sn - object ?t1 - object ?t2 - object ?st - object ?s - stage ?s2 - stage)
    :precondition (and
      (sneeze ?sn)
      (texture ?t1)
      (texture ?t2)
      (stupendous ?st)
      (next ?sn ?t1)
      (collect ?t1 ?st)
      (collect ?t2 ?st)
      (current ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (next ?sn ?t2)
      (not (next ?sn ?t1))
      ;; advance stage
      (not (current ?s))
      (current ?s2)
    )
  )

  (:action memory
    :parameters (?c - object ?sp1 - object ?sp2 - object ?s - stage ?s2 - stage)
    :precondition (and
      (cats ?c)
      (spring ?sp1)
      (spring ?sp2)
      (next ?c ?sp1)
      (current ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (next ?c ?sp2)
      (not (next ?c ?sp1))
      ;; advance stage
      (not (current ?s))
      (current ?s2)
    )
  )

  (:action tightfisted
    :parameters (?h - object ?sn - object ?t - object ?s - stage ?s2 - stage)
    :precondition (and
      (hand ?h)
      (sneeze ?sn)
      (texture ?t)
      (next ?sn ?t)
      (vase ?h ?sn)
      (current ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (next ?h ?t)
      (not (vase ?h ?sn))
      ;; advance stage
      (not (current ?s))
      (current ?s2)
    )
  )
)