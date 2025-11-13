(define (domain ObfuscatedDeceptiveLogistics29)
  (:requirements :strips :negative-preconditions)
  (:predicates
    (hand ?x)
    (cats ?x)
    (texture ?x)
    (vase ?x ?y)
    (next ?x ?y)
    (sneeze ?x)
    (collect ?x ?y)
    (spring ?x)
    (stupendous ?x)
    (at ?t)
    (succ ?t ?t2)
  )

  ;; Paltry: requires hand X0, cats X1, texture X2, vase X0 X1, next X1 X2
  ;; Effects: add next X0 X2, delete vase X0 X1; advance time
  (:action paltry
    :parameters (?x0 ?x1 ?x2 ?t ?t2)
    :precondition (and (at ?t) (succ ?t ?t2)
                       (hand ?x0) (cats ?x1) (texture ?x2) (vase ?x0 ?x1) (next ?x1 ?x2))
    :effect (and
             (not (at ?t)) (at ?t2)
             (next ?x0 ?x2)
             (not (vase ?x0 ?x1))
            )
  )

  ;; Sip: requires hand X0, cats X1, texture X2, next X0 X2, next X1 X2
  ;; Effects: add vase X0 X1, delete next X0 X2; advance time
  (:action sip
    :parameters (?x0 ?x1 ?x2 ?t ?t2)
    :precondition (and (at ?t) (succ ?t ?t2)
                       (hand ?x0) (cats ?x1) (texture ?x2) (next ?x0 ?x2) (next ?x1 ?x2))
    :effect (and
             (not (at ?t)) (at ?t2)
             (vase ?x0 ?x1)
             (not (next ?x0 ?x2))
            )
  )

  ;; Clip: requires hand X0, sneeze X1, texture X2, next X1 X2, next X0 X2
  ;; Effects: add vase X0 X1, delete next X0 X2; advance time
  (:action clip
    :parameters (?x0 ?x1 ?x2 ?t ?t2)
    :precondition (and (at ?t) (succ ?t ?t2)
                       (hand ?x0) (sneeze ?x1) (texture ?x2) (next ?x1 ?x2) (next ?x0 ?x2))
    :effect (and
             (not (at ?t)) (at ?t2)
             (vase ?x0 ?x1)
             (not (next ?x0 ?x2))
            )
  )

  ;; Wretched: requires sneeze X0, texture X1, texture X2, stupendous X3, next X0 X1, collect X1 X3, collect X2 X3
  ;; Effects: add next X0 X2, delete next X0 X1; advance time
  (:action wretched
    :parameters (?x0 ?x1 ?x2 ?x3 ?t ?t2)
    :precondition (and (at ?t) (succ ?t ?t2)
                       (sneeze ?x0) (texture ?x1) (texture ?x2) (stupendous ?x3)
                       (next ?x0 ?x1) (collect ?x1 ?x3) (collect ?x2 ?x3))
    :effect (and
             (not (at ?t)) (at ?t2)
             (next ?x0 ?x2)
             (not (next ?x0 ?x1))
            )
  )

  ;; Memory: requires cats X0, spring X1, spring X2, next X0 X1
  ;; Effects: add next X0 X2, delete next X0 X1; advance time
  (:action memory
    :parameters (?x0 ?x1 ?x2 ?t ?t2)
    :precondition (and (at ?t) (succ ?t ?t2)
                       (cats ?x0) (spring ?x1) (spring ?x2) (next ?x0 ?x1))
    :effect (and
             (not (at ?t)) (at ?t2)
             (next ?x0 ?x2)
             (not (next ?x0 ?x1))
            )
  )

  ;; Tightfisted: requires hand X0, sneeze X1, texture X2, next X1 X2, vase X0 X1
  ;; Effects: add next X0 X2, delete vase X0 X1; advance time
  (:action tightfisted
    :parameters (?x0 ?x1 ?x2 ?t ?t2)
    :precondition (and (at ?t) (succ ?t ?t2)
                       (hand ?x0) (sneeze ?x1) (texture ?x2) (next ?x1 ?x2) (vase ?x0 ?x1))
    :effect (and
             (not (at ?t)) (at ?t2)
             (next ?x0 ?x2)
             (not (vase ?x0 ?x1))
            )
  )
)