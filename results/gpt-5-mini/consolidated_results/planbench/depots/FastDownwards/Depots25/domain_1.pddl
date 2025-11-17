(define (domain artifact-manipulation)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)

  (:predicates
    (hand ?x - obj)
    (cats ?x - obj)
    (texture ?x - obj)
    (sneeze ?x - obj)
    (spring ?x - obj)
    (stupendous ?x - obj)
    (collect ?x - obj ?y - obj)
    (next ?x - obj ?y - obj)
    (vase ?x - obj ?y - obj)
  )

  ;; paltry: hand H, cats O1, texture T, vase H O1, next O1 T -> add next H T, del vase H O1
  (:action paltry
    :parameters (?h - obj ?o1 - obj ?t - obj)
    :precondition (and (hand ?h) (cats ?o1) (texture ?t) (vase ?h ?o1) (next ?o1 ?t))
    :effect (and (next ?h ?t) (not (vase ?h ?o1)))
  )

  ;; sip: hand H, cats O1, texture T, next H T, next O1 T -> add vase H O1, del next H T
  (:action sip
    :parameters (?h - obj ?o1 - obj ?t - obj)
    :precondition (and (hand ?h) (cats ?o1) (texture ?t) (next ?h ?t) (next ?o1 ?t))
    :effect (and (vase ?h ?o1) (not (next ?h ?t)))
  )

  ;; clip: hand H, sneeze O1, texture T, next O1 T, next H T -> add vase H O1, del next H T
  (:action clip
    :parameters (?h - obj ?o1 - obj ?t - obj)
    :precondition (and (hand ?h) (sneeze ?o1) (texture ?t) (next ?o1 ?t) (next ?h ?t))
    :effect (and (vase ?h ?o1) (not (next ?h ?t)))
  )

  ;; wretched: sneeze O0, texture O1, texture O2, stupendous S, next O0 O1, collect O1 S, collect O2 S
  ;; effect: add next O0 O2, del next O0 O1
  (:action wretched
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?s - obj)
    :precondition (and (sneeze ?o0) (texture ?o1) (texture ?o2) (stupendous ?s)
                       (next ?o0 ?o1) (collect ?o1 ?s) (collect ?o2 ?s))
    :effect (and (next ?o0 ?o2) (not (next ?o0 ?o1)))
  )

  ;; memory: cats C, spring S1, spring S2, next C S1 -> add next C S2, del next C S1
  (:action memory
    :parameters (?c - obj ?s1 - obj ?s2 - obj)
    :precondition (and (cats ?c) (spring ?s1) (spring ?s2) (next ?c ?s1))
    :effect (and (next ?c ?s2) (not (next ?c ?s1)))
  )

  ;; tightfisted: hand H, sneeze O1, texture T, next O1 T, vase H O1 -> add next H T, del vase H O1
  (:action tightfisted
    :parameters (?h - obj ?o1 - obj ?t - obj)
    :precondition (and (hand ?h) (sneeze ?o1) (texture ?t) (next ?o1 ?t) (vase ?h ?o1))
    :effect (and (next ?h ?t) (not (vase ?h ?o1)))
  )
)