(define (domain obfuscated_deceptive_logistics1)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)

  (:predicates
    (cats ?x - obj)
    (hand ?x - obj)
    (texture ?x - obj)
    (vase ?x - obj ?y - obj)
    (next ?x - obj ?y - obj)
    (sneeze ?x - obj)
    (collect ?x - obj ?y - obj)
    (spring ?x - obj)
    (stupendous ?x - obj)
  )

  ;; paltry: requires hand ?h, cats ?c, texture ?t, vase ?h ?c, next ?c ?t
  ;; effects: add next ?h ?t, del vase ?h ?c
  (:action paltry
    :parameters (?h - obj ?c - obj ?t - obj)
    :precondition (and (hand ?h) (cats ?c) (texture ?t) (vase ?h ?c) (next ?c ?t))
    :effect (and (next ?h ?t) (not (vase ?h ?c)))
  )

  ;; sip: requires hand ?h, cats ?c, texture ?t, next ?h ?t, next ?c ?t
  ;; effects: add vase ?h ?c, del next ?h ?t
  (:action sip
    :parameters (?h - obj ?c - obj ?t - obj)
    :precondition (and (hand ?h) (cats ?c) (texture ?t) (next ?h ?t) (next ?c ?t))
    :effect (and (vase ?h ?c) (not (next ?h ?t)))
  )

  ;; clip: requires hand ?h, sneeze ?s, texture ?t, next ?s ?t, next ?h ?t
  ;; effects: add vase ?h ?s, del next ?h ?t
  (:action clip
    :parameters (?h - obj ?s - obj ?t - obj)
    :precondition (and (hand ?h) (sneeze ?s) (texture ?t) (next ?s ?t) (next ?h ?t))
    :effect (and (vase ?h ?s) (not (next ?h ?t)))
  )

  ;; wretched: requires sneeze ?s, texture ?t1, texture ?t2, stupendous ?st,
  ;;           next ?s ?t1, collect ?t1 ?st, collect ?t2 ?st
  ;; effects: add next ?s ?t2, del next ?s ?t1
  (:action wretched
    :parameters (?s - obj ?t1 - obj ?t2 - obj ?st - obj)
    :precondition (and (sneeze ?s) (texture ?t1) (texture ?t2) (stupendous ?st)
                       (next ?s ?t1) (collect ?t1 ?st) (collect ?t2 ?st))
    :effect (and (next ?s ?t2) (not (next ?s ?t1)))
  )

  ;; memory: requires cats ?c, spring ?s1, spring ?s2, next ?c ?s1
  ;; effects: add next ?c ?s2, del next ?c ?s1
  (:action memory
    :parameters (?c - obj ?s1 - obj ?s2 - obj)
    :precondition (and (cats ?c) (spring ?s1) (spring ?s2) (next ?c ?s1))
    :effect (and (next ?c ?s2) (not (next ?c ?s1)))
  )

  ;; tightfisted: requires hand ?h, sneeze ?s, texture ?t, next ?s ?t, vase ?h ?s
  ;; effects: add next ?h ?t, del vase ?h ?s
  (:action tightfisted
    :parameters (?h - obj ?s - obj ?t - obj)
    :precondition (and (hand ?h) (sneeze ?s) (texture ?t) (next ?s ?t) (vase ?h ?s))
    :effect (and (next ?h ?t) (not (vase ?h ?s)))
  )
)