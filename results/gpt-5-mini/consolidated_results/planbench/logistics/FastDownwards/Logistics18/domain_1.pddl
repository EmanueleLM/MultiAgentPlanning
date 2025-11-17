(define (domain objects-manipulation)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)

  (:predicates
    (hand ?o - obj)
    (cats ?o - obj)
    (texture ?o - obj)
    (vase ?o1 - obj ?o2 - obj)
    (next ?o1 - obj ?o2 - obj)
    (sneeze ?o - obj)
    (collect ?o1 - obj ?o2 - obj)
    (spring ?o - obj)
    (stupendous ?o - obj)
  )

  ;; paltry: requires hand, cats, texture, vase(h,c), next(c,t)
  ;; effects: set next(h,t), remove vase(h,c)
  (:action paltry
    :parameters (?h - obj ?c - obj ?t - obj)
    :precondition (and (hand ?h) (cats ?c) (texture ?t) (vase ?h ?c) (next ?c ?t))
    :effect (and (next ?h ?t) (not (vase ?h ?c)))
  )

  ;; sip: requires hand, cats, texture, next(h,t), next(c,t)
  ;; effects: set vase(h,c), remove next(h,t)
  (:action sip
    :parameters (?h - obj ?c - obj ?t - obj)
    :precondition (and (hand ?h) (cats ?c) (texture ?t) (next ?h ?t) (next ?c ?t))
    :effect (and (vase ?h ?c) (not (next ?h ?t)))
  )

  ;; clip: requires hand, sneeze, texture, next(s,t), next(h,t)
  ;; effects: set vase(h,s), remove next(h,t)
  (:action clip
    :parameters (?h - obj ?s - obj ?t - obj)
    :precondition (and (hand ?h) (sneeze ?s) (texture ?t) (next ?s ?t) (next ?h ?t))
    :effect (and (vase ?h ?s) (not (next ?h ?t)))
  )

  ;; wretched: requires sneeze s, texture t1, texture t2, stupendous st, next s t1, collect t1 st, collect t2 st
  ;; effects: set next s t2, remove next s t1
  (:action wretched
    :parameters (?s - obj ?t1 - obj ?t2 - obj ?st - obj)
    :precondition (and (sneeze ?s) (texture ?t1) (texture ?t2) (stupendous ?st) (next ?s ?t1) (collect ?t1 ?st) (collect ?t2 ?st))
    :effect (and (next ?s ?t2) (not (next ?s ?t1)))
  )

  ;; memory: requires cats c, spring s1, spring s2, next c s1
  ;; effects: set next c s2, remove next c s1
  (:action memory
    :parameters (?c - obj ?s1 - obj ?s2 - obj)
    :precondition (and (cats ?c) (spring ?s1) (spring ?s2) (next ?c ?s1))
    :effect (and (next ?c ?s2) (not (next ?c ?s1)))
  )

  ;; tightfisted: requires hand h, sneeze s, texture t, next s t, vase h s
  ;; effects: set next h t, remove vase h s
  (:action tightfisted
    :parameters (?h - obj ?s - obj ?t - obj)
    :precondition (and (hand ?h) (sneeze ?s) (texture ?t) (next ?s ?t) (vase ?h ?s))
    :effect (and (next ?h ?t) (not (vase ?h ?s)))
  )
)