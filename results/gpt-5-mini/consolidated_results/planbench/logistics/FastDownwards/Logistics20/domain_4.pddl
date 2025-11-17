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

    ;; explicit discrete time / stage bookkeeping to enforce contiguous occupancy
    (current ?s - stage)
    (succ ?s1 - stage ?s2 - stage)
  )

  ;; paltry: preconds exactly as specified plus contiguous-stage requirement
  ;; pre: hand ?h, cats ?c, texture ?t, vase ?h ?c, next ?c ?t
  ;; add: next ?h ?t
  ;; del: vase ?h ?c
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
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; sip: pre: hand, cats, texture, next hand->t, next cats->t
  ;; add: vase hand cats
  ;; del: next hand t
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
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; clip: pre: hand, sneeze, texture, next sneeze->t, next hand->t
  ;; add: vase hand sneeze
  ;; del: next hand t
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
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; wretched: pre: sneeze, texture t1, texture t2, stupendous st,
  ;; next sneeze t1, collect t1 st, collect t2 st
  ;; add: next sneeze t2
  ;; del: next sneeze t1
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
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; memory: pre: cats c, spring sp1, spring sp2, next c sp1
  ;; add: next c sp2
  ;; del: next c sp1
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
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; tightfisted: pre: hand h, sneeze sn, texture t, next sn t, vase h sn
  ;; add: next h t
  ;; del: vase h sn
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
      (not (current ?s))
      (current ?s2)
    )
  )
)