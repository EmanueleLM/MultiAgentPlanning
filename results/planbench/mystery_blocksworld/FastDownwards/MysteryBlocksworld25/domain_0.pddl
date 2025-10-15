(define (domain scenario_domain)
  (:requirements :typing :negative-preconditions :strips)
  (:types obj)

  (:predicates
    (hand ?o - obj)
    (cats ?o - obj)
    (texture ?o - obj)
    (vase ?o1 - obj ?o2 - obj)
    (next ?o1 - obj ?o2 - obj)
    (sneeze ?o - obj)
    (spring ?o - obj)
    (collect ?o1 - obj ?o2 - obj)
    (stupendous ?o - obj)
  )

  ;; Paltry: params (hand_obj, cats_obj, texture_obj)
  ;; pre: hand ?h, cats ?c, texture ?t, vase ?h ?c, next ?c ?t
  ;; eff: add next ?h ?t, del vase ?h ?c
  (:action paltry
    :parameters (?h - obj ?c - obj ?t - obj)
    :precondition (and
      (hand ?h)
      (cats ?c)
      (texture ?t)
      (vase ?h ?c)
      (next ?c ?t)
    )
    :effect (and
      (next ?h ?t)
      (not (vase ?h ?c))
    )
  )

  ;; Sip: params (hand_obj, cats_obj, texture_obj)
  ;; pre: hand ?h, cats ?c, texture ?t, next ?h ?t, next ?c ?t
  ;; eff: add vase ?h ?c, del next ?h ?t
  (:action sip
    :parameters (?h - obj ?c - obj ?t - obj)
    :precondition (and
      (hand ?h)
      (cats ?c)
      (texture ?t)
      (next ?h ?t)
      (next ?c ?t)
    )
    :effect (and
      (vase ?h ?c)
      (not (next ?h ?t))
    )
  )

  ;; Clip: params (hand_obj, sneeze_obj, texture_obj)
  ;; pre: hand ?h, sneeze ?s, texture ?t, next ?s ?t, next ?h ?t
  ;; eff: add vase ?h ?s, del next ?h ?t
  (:action clip
    :parameters (?h - obj ?s - obj ?t - obj)
    :precondition (and
      (hand ?h)
      (sneeze ?s)
      (texture ?t)
      (next ?s ?t)
      (next ?h ?t)
    )
    :effect (and
      (vase ?h ?s)
      (not (next ?h ?t))
    )
  )

  ;; Wretched: params (sneeze_subject, texture1, texture2, stupendous_obj)
  ;; pre: sneeze ?s0, texture ?t1, texture ?t2, stupendous ?stp, next ?s0 ?t1, collect ?t1 ?stp, collect ?t2 ?stp
  ;; eff: add next ?s0 ?t2, del next ?s0 ?t1
  (:action wretched
    :parameters (?s0 - obj ?t1 - obj ?t2 - obj ?stp - obj)
    :precondition (and
      (sneeze ?s0)
      (texture ?t1)
      (texture ?t2)
      (stupendous ?stp)
      (next ?s0 ?t1)
      (collect ?t1 ?stp)
      (collect ?t2 ?stp)
    )
    :effect (and
      (next ?s0 ?t2)
      (not (next ?s0 ?t1))
    )
  )

  ;; Memory: params (cats_obj, spring1, spring2)
  ;; pre: cats ?c, spring ?s1, spring ?s2, next ?c ?s1
  ;; eff: add next ?c ?s2, del next ?c ?s1
  (:action memory
    :parameters (?c - obj ?s1 - obj ?s2 - obj)
    :precondition (and
      (cats ?c)
      (spring ?s1)
      (spring ?s2)
      (next ?c ?s1)
    )
    :effect (and
      (next ?c ?s2)
      (not (next ?c ?s1))
    )
  )

  ;; Tightfisted: params (hand_obj, sneeze_obj, texture_obj)
  ;; pre: hand ?h, sneeze ?s, texture ?t, next ?s ?t, vase ?h ?s
  ;; eff: add next ?h ?t, del vase ?h ?s
  (:action tightfisted
    :parameters (?h - obj ?s - obj ?t - obj)
    :precondition (and
      (hand ?h)
      (sneeze ?s)
      (texture ?t)
      (next ?s ?t)
      (vase ?h ?s)
    )
    :effect (and
      (next ?h ?t)
      (not (vase ?h ?s))
    )
  )
)