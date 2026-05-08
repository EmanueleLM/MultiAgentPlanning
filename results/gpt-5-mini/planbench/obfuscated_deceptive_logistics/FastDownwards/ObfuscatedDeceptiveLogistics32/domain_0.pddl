(define (domain jack_of_all_trades)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)

  (:predicates
    (hand ?o - obj)
    (cats ?o - obj)
    (texture ?o - obj)
    (vase ?a ?b - obj)
    (next ?a ?b - obj)
    (sneeze ?o - obj)
    (collect ?a ?b - obj)
    (spring ?o - obj)
    (stupendous ?o - obj)
  )

  ;; paltry(?h ?c ?t)
  ;; pre: hand ?h, cats ?c, texture ?t, vase ?h ?c, next ?c ?t
  ;; eff: add next ?h ?t; del vase ?h ?c
  (:action paltry
    :parameters (?h ?c ?t - obj)
    :precondition (and (hand ?h) (cats ?c) (texture ?t) (vase ?h ?c) (next ?c ?t))
    :effect (and (next ?h ?t) (not (vase ?h ?c)))
  )

  ;; sip(?h ?c ?t)
  ;; pre: hand ?h, cats ?c, texture ?t, next ?h ?t, next ?c ?t
  ;; eff: add vase ?h ?c; del next ?h ?t
  (:action sip
    :parameters (?h ?c ?t - obj)
    :precondition (and (hand ?h) (cats ?c) (texture ?t) (next ?h ?t) (next ?c ?t))
    :effect (and (vase ?h ?c) (not (next ?h ?t)))
  )

  ;; clip(?h ?s ?t)
  ;; pre: hand ?h, sneeze ?s, texture ?t, next ?s ?t, next ?h ?t
  ;; eff: add vase ?h ?s; del next ?h ?t
  (:action clip
    :parameters (?h ?s ?t - obj)
    :precondition (and (hand ?h) (sneeze ?s) (texture ?t) (next ?s ?t) (next ?h ?t))
    :effect (and (vase ?h ?s) (not (next ?h ?t)))
  )

  ;; wretched(?s ?t1 ?t2 ?u)
  ;; pre: sneeze ?s, texture ?t1, texture ?t2, stupendous ?u, next ?s ?t1, collect ?t1 ?u, collect ?t2 ?u
  ;; eff: add next ?s ?t2; del next ?s ?t1
  (:action wretched
    :parameters (?s ?t1 ?t2 ?u - obj)
    :precondition (and (sneeze ?s) (texture ?t1) (texture ?t2) (stupendous ?u) (next ?s ?t1) (collect ?t1 ?u) (collect ?t2 ?u))
    :effect (and (next ?s ?t2) (not (next ?s ?t1)))
  )

  ;; memory(?c ?s1 ?s2)
  ;; pre: cats ?c, spring ?s1, spring ?s2, next ?c ?s1
  ;; eff: add next ?c ?s2; del next ?c ?s1
  (:action memory
    :parameters (?c ?s1 ?s2 - obj)
    :precondition (and (cats ?c) (spring ?s1) (spring ?s2) (next ?c ?s1))
    :effect (and (next ?c ?s2) (not (next ?c ?s1)))
  )

  ;; tightfisted(?h ?s ?t)
  ;; pre: hand ?h, sneeze ?s, texture ?t, next ?s ?t, vase ?h ?s
  ;; eff: add next ?h ?t; del vase ?h ?s
  (:action tightfisted
    :parameters (?h ?s ?t - obj)
    :precondition (and (hand ?h) (sneeze ?s) (texture ?t) (next ?s ?t) (vase ?h ?s))
    :effect (and (next ?h ?t) (not (vase ?h ?s)))
  )

)