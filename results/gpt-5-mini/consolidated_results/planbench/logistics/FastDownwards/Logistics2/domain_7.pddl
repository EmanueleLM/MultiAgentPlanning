(define (domain next-vase-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj stage)

  ;; Predicates
  (:predicates
    (cats ?x - obj)
    (collect ?x - obj ?y - obj)
    (hand ?x - obj)
    (next ?x - obj ?y - obj)
    (sneeze ?x - obj)
    (spring ?x - obj)
    (stupendous ?x - obj)
    (texture ?x - obj)
    (vase ?x - obj ?y - obj)
    (now ?t - stage)
    (succ ?t - stage ?t2 - stage)
  )

  ;;; Note: discrete time (stages) is enforced explicitly.
  ;;; Every action requires the current stage (now ?t) and a successor stage (succ ?t ?t2).
  ;;; Effects move (now ?t) -> (now ?t2). This prevents oscillation and enforces contiguous
  ;;; occupancy of stages; no bookkeeping tokens or post-hoc repairs are allowed.

  ;; memory(o0,o1,o2):
  ;;   pre: cats o0, spring o1, spring o2, next o0 o1, now t, succ t t2
  ;;   eff: add next o0 o2; del next o0 o1; advance time to t2
  (:action memory
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?t - stage ?t2 - stage)
    :precondition (and (cats ?o0) (spring ?o1) (spring ?o2) (next ?o0 ?o1) (now ?t) (succ ?t ?t2))
    :effect (and (next ?o0 ?o2) (not (next ?o0 ?o1)) (now ?t2) (not (now ?t)))
  )

  ;; sip(o0,o1,o2):
  ;;   pre: hand o0, cats o1, texture o2, next o0 o2, next o1 o2, now t, succ t t2
  ;;   eff: add vase o0 o1; del next o0 o2; advance time
  (:action sip
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?t - stage ?t2 - stage)
    :precondition (and (hand ?o0) (cats ?o1) (texture ?o2) (next ?o0 ?o2) (next ?o1 ?o2) (now ?t) (succ ?t ?t2))
    :effect (and (vase ?o0 ?o1) (not (next ?o0 ?o2)) (now ?t2) (not (now ?t)))
  )

  ;; paltry(o0,o1,o2):
  ;;   pre: hand o0, cats o1, texture o2, vase o0 o1, next o1 o2, now t, succ t t2
  ;;   eff: add next o0 o2; del vase o0 o1; advance time
  (:action paltry
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?t - stage ?t2 - stage)
    :precondition (and (hand ?o0) (cats ?o1) (texture ?o2) (vase ?o0 ?o1) (next ?o1 ?o2) (now ?t) (succ ?t ?t2))
    :effect (and (next ?o0 ?o2) (not (vase ?o0 ?o1)) (now ?t2) (not (now ?t)))
  )

  ;; clip(o0,o1,o2):
  ;;   pre: hand o0, sneeze o1, texture o2, next o1 o2, next o0 o2, now t, succ t t2
  ;;   eff: add vase o0 o1; del next o0 o2; advance time
  (:action clip
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?t - stage ?t2 - stage)
    :precondition (and (hand ?o0) (sneeze ?o1) (texture ?o2) (next ?o1 ?o2) (next ?o0 ?o2) (now ?t) (succ ?t ?t2))
    :effect (and (vase ?o0 ?o1) (not (next ?o0 ?o2)) (now ?t2) (not (now ?t)))
  )

  ;; wretched(o0,o1,o2,o3):
  ;;   pre: sneeze o0, texture o1, texture o2, stupendous o3, next o0 o1,
  ;;        collect o1 o3, collect o2 o3, now t, succ t t2
  ;;   eff: add next o0 o2; del next o0 o1; advance time
  (:action wretched
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?o3 - obj ?t - stage ?t2 - stage)
    :precondition (and (sneeze ?o0) (texture ?o1) (texture ?o2) (stupendous ?o3)
                       (next ?o0 ?o1) (collect ?o1 ?o3) (collect ?o2 ?o3) (now ?t) (succ ?t ?t2))
    :effect (and (next ?o0 ?o2) (not (next ?o0 ?o1)) (now ?t2) (not (now ?t)))
  )

  ;; tightfisted(o0,o1,o2):
  ;;   pre: hand o0, sneeze o1, texture o2, next o1 o2, vase o0 o1, now t, succ t t2
  ;;   eff: add next o0 o2; del vase o0 o1; advance time
  (:action tightfisted
    :parameters (?o0 - obj ?o1 - obj ?o2 - obj ?t - stage ?t2 - stage)
    :precondition (and (hand ?o0) (sneeze ?o1) (texture ?o2) (next ?o1 ?o2) (vase ?o0 ?o1) (now ?t) (succ ?t ?t2))
    :effect (and (next ?o0 ?o2) (not (vase ?o0 ?o1)) (now ?t2) (not (now ?t)))
  )

)