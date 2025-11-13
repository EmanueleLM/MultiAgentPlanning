(define (domain obfuscated-deceptive-logistics11)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj stage)

  (:predicates
    (hand ?x - obj)
    (cats ?x - obj)
    (texture ?x - obj)
    (vase ?x - obj ?y - obj)
    (next ?x - obj ?y - obj)
    (sneeze ?x - obj)
    (collect ?x - obj ?y - obj)
    (spring ?x - obj)
    (stupendous ?x - obj)
    (current ?s - stage)
    (succ ?s - stage ?s2 - stage)
  )

  ;; paltry: requires hand ?h, cats ?c, texture ?t, vase ?h ?c, next ?c ?t
  ;; effect: add next ?h ?t, delete vase ?h ?c
  (:action paltry
    :parameters (?h - obj ?c - obj ?t - obj ?st - stage ?stn - stage)
    :precondition (and
      (hand ?h)
      (cats ?c)
      (texture ?t)
      (vase ?h ?c)
      (next ?c ?t)
      (current ?st)
      (succ ?st ?stn)
    )
    :effect (and
      (next ?h ?t)
      (not (vase ?h ?c))
      (not (current ?st))
      (current ?stn)
    )
  )

  ;; sip: requires hand ?h, cats ?c, texture ?t, next ?h ?t, next ?c ?t
  ;; effect: add vase ?h ?c, delete next ?h ?t
  (:action sip
    :parameters (?h - obj ?c - obj ?t - obj ?st - stage ?stn - stage)
    :precondition (and
      (hand ?h)
      (cats ?c)
      (texture ?t)
      (next ?h ?t)
      (next ?c ?t)
      (current ?st)
      (succ ?st ?stn)
    )
    :effect (and
      (vase ?h ?c)
      (not (next ?h ?t))
      (not (current ?st))
      (current ?stn)
    )
  )

  ;; clip: requires hand ?h, sneeze ?sn, texture ?t, next ?sn ?t, next ?h ?t
  ;; effect: add vase ?h ?sn, delete next ?h ?t
  (:action clip
    :parameters (?h - obj ?sn - obj ?t - obj ?st - stage ?stn - stage)
    :precondition (and
      (hand ?h)
      (sneeze ?sn)
      (texture ?t)
      (next ?sn ?t)
      (next ?h ?t)
      (current ?st)
      (succ ?st ?stn)
    )
    :effect (and
      (vase ?h ?sn)
      (not (next ?h ?t))
      (not (current ?st))
      (current ?stn)
    )
  )

  ;; wretched: requires sneeze ?sn, texture ?t1, texture ?t2, stupendous ?stp,
  ;; next ?sn ?t1, collect ?t1 ?stp, collect ?t2 ?stp
  ;; effect: add next ?sn ?t2, delete next ?sn ?t1
  (:action wretched
    :parameters (?sn - obj ?t1 - obj ?t2 - obj ?stp - obj ?st - stage ?stn - stage)
    :precondition (and
      (sneeze ?sn)
      (texture ?t1)
      (texture ?t2)
      (stupendous ?stp)
      (next ?sn ?t1)
      (collect ?t1 ?stp)
      (collect ?t2 ?stp)
      (current ?st)
      (succ ?st ?stn)
    )
    :effect (and
      (next ?sn ?t2)
      (not (next ?sn ?t1))
      (not (current ?st))
      (current ?stn)
    )
  )

  ;; memory: requires cats ?c, spring ?s1, spring ?s2, next ?c ?s1
  ;; effect: add next ?c ?s2, delete next ?c ?s1
  (:action memory
    :parameters (?c - obj ?s1 - obj ?s2 - obj ?st - stage ?stn - stage)
    :precondition (and
      (cats ?c)
      (spring ?s1)
      (spring ?s2)
      (next ?c ?s1)
      (current ?st)
      (succ ?st ?stn)
    )
    :effect (and
      (next ?c ?s2)
      (not (next ?c ?s1))
      (not (current ?st))
      (current ?stn)
    )
  )

  ;; tightfisted: requires hand ?h, sneeze ?sn, texture ?t, next ?sn ?t, vase ?h ?sn
  ;; effect: add next ?h ?t, delete vase ?h ?sn
  (:action tightfisted
    :parameters (?h - obj ?sn - obj ?t - obj ?st - stage ?stn - stage)
    :precondition (and
      (hand ?h)
      (sneeze ?sn)
      (texture ?t)
      (next ?sn ?t)
      (vase ?h ?sn)
      (current ?st)
      (succ ?st ?stn)
    )
    :effect (and
      (next ?h ?t)
      (not (vase ?h ?sn))
      (not (current ?st))
      (current ?stn)
    )
  )
)