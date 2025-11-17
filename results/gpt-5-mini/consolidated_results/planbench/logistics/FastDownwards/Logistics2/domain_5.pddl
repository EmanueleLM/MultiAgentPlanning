(define (domain next-vase-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj stage)

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

  ;; Each action requires the current stage (now ?t) and a successor stage (succ ?t ?t2).
  ;; Executing an action advances the "now" marker to the successor stage, enforcing ordered
  ;; discrete progression and preventing oscillation or out-of-order application.

  (:action memory
    :parameters (?x - obj ?y - obj ?z - obj ?t - stage ?t2 - stage)
    :precondition (and (cats ?x) (spring ?y) (spring ?z) (next ?x ?y) (now ?t) (succ ?t ?t2))
    :effect (and (next ?x ?z) (not (next ?x ?y)) (now ?t2) (not (now ?t)))
  )

  (:action sip
    :parameters (?h - obj ?c - obj ?tx - obj ?t - stage ?t2 - stage)
    :precondition (and (hand ?h) (cats ?c) (texture ?tx) (next ?h ?tx) (next ?c ?tx) (now ?t) (succ ?t ?t2))
    :effect (and (vase ?h ?c) (not (next ?h ?tx)) (now ?t2) (not (now ?t)))
  )

  (:action paltry
    :parameters (?h - obj ?c - obj ?tx - obj ?t - stage ?t2 - stage)
    :precondition (and (hand ?h) (cats ?c) (texture ?tx) (vase ?h ?c) (next ?c ?tx) (now ?t) (succ ?t ?t2))
    :effect (and (next ?h ?tx) (not (vase ?h ?c)) (now ?t2) (not (now ?t)))
  )

  (:action clip
    :parameters (?h - obj ?s - obj ?tx - obj ?t - stage ?t2 - stage)
    :precondition (and (hand ?h) (sneeze ?s) (texture ?tx) (next ?s ?tx) (next ?h ?tx) (now ?t) (succ ?t ?t2))
    :effect (and (vase ?h ?s) (not (next ?h ?tx)) (now ?t2) (not (now ?t)))
  )

  (:action wretched
    :parameters (?s - obj ?t1 - obj ?t2 - obj ?o - obj ?t - stage ?t2s - stage)
    :precondition (and (sneeze ?s) (texture ?t1) (texture ?t2) (stupendous ?o)
                       (next ?s ?t1) (collect ?t1 ?o) (collect ?t2 ?o) (now ?t) (succ ?t ?t2s))
    :effect (and (next ?s ?t2) (not (next ?s ?t1)) (now ?t2s) (not (now ?t)))
  )

  (:action tightfisted
    :parameters (?h - obj ?s - obj ?tx - obj ?t - stage ?t2 - stage)
    :precondition (and (hand ?h) (sneeze ?s) (texture ?tx) (next ?s ?tx) (vase ?h ?s) (now ?t) (succ ?t ?t2))
    :effect (and (next ?h ?tx) (not (vase ?h ?s)) (now ?t2) (not (now ?t)))
  )
)