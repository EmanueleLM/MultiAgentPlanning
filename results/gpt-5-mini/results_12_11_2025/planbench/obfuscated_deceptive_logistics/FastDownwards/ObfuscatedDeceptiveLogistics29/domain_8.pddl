(define (domain ObfuscatedDeceptiveLogistics29)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    hand_t cats_t sneeze_t stupendous_t - obj
    time
    obj
  )

  (:predicates
    (vase ?x - obj ?y - obj)
    (next ?x - obj ?y - obj)
    (collect ?x - obj ?y - obj)
    (spring ?x - obj)
    (texture ?x - obj)
    (at ?t - time)
    (succ ?t - time ?t2 - time)
  )

  ;; Paltry: requires hand X0 (typed), cats X1 (typed), texture X2, vase X0 X1, next X1 X2
  ;; Effects: add next X0 X2, delete vase X0 X1; advance time stage
  (:action paltry
    :parameters (?x0 - hand_t ?x1 - cats_t ?x2 - obj ?t - time ?t2 - time)
    :precondition (and
                    (at ?t) (succ ?t ?t2)
                    (texture ?x2)
                    (vase ?x0 ?x1)
                    (next ?x1 ?x2)
                  )
    :effect (and
              (not (at ?t)) (at ?t2)
              (next ?x0 ?x2)
              (not (vase ?x0 ?x1))
            )
  )

  ;; Sip: requires hand X0 (typed), cats X1 (typed), texture X2, next X0 X2, next X1 X2
  ;; Effects: add vase X0 X1, delete next X0 X2; advance time
  (:action sip
    :parameters (?x0 - hand_t ?x1 - cats_t ?x2 - obj ?t - time ?t2 - time)
    :precondition (and
                    (at ?t) (succ ?t ?t2)
                    (texture ?x2)
                    (next ?x0 ?x2) (next ?x1 ?x2)
                  )
    :effect (and
              (not (at ?t)) (at ?t2)
              (vase ?x0 ?x1)
              (not (next ?x0 ?x2))
            )
  )

  ;; Clip: requires hand X0 (typed), sneeze X1 (typed), texture X2, next X1 X2, next X0 X2
  ;; Effects: add vase X0 X1, delete next X0 X2; advance time
  (:action clip
    :parameters (?x0 - hand_t ?x1 - sneeze_t ?x2 - obj ?t - time ?t2 - time)
    :precondition (and
                    (at ?t) (succ ?t ?t2)
                    (texture ?x2)
                    (next ?x1 ?x2) (next ?x0 ?x2)
                  )
    :effect (and
              (not (at ?t)) (at ?t2)
              (vase ?x0 ?x1)
              (not (next ?x0 ?x2))
            )
  )

  ;; Wretched: requires sneeze X0 (typed), texture X1, texture X2, stupendous X3 (typed),
  ;;           next X0 X1, collect X1 X3, collect X2 X3
  ;; Effects: add next X0 X2, delete next X0 X1; advance time
  (:action wretched
    :parameters (?x0 - sneeze_t ?x1 - obj ?x2 - obj ?x3 - stupendous_t ?t - time ?t2 - time)
    :precondition (and
                    (at ?t) (succ ?t ?t2)
                    (texture ?x1) (texture ?x2)
                    (next ?x0 ?x1) (collect ?x1 ?x3) (collect ?x2 ?x3)
                  )
    :effect (and
              (not (at ?t)) (at ?t2)
              (next ?x0 ?x2)
              (not (next ?x0 ?x1))
            )
  )

  ;; Memory: requires cats X0 (typed), spring X1, spring X2, next X0 X1
  ;; Effects: add next X0 X2, delete next X0 X1; advance time
  (:action memory
    :parameters (?x0 - cats_t ?x1 - obj ?x2 - obj ?t - time ?t2 - time)
    :precondition (and
                    (at ?t) (succ ?t ?t2)
                    (spring ?x1) (spring ?x2)
                    (next ?x0 ?x1)
                  )
    :effect (and
              (not (at ?t)) (at ?t2)
              (next ?x0 ?x2)
              (not (next ?x0 ?x1))
            )
  )

  ;; Tightfisted: requires hand X0 (typed), sneeze X1 (typed), texture X2, next X1 X2, vase X0 X1
  ;; Effects: add next X0 X2, delete vase X0 X1; advance time
  (:action tightfisted
    :parameters (?x0 - hand_t ?x1 - sneeze_t ?x2 - obj ?t - time ?t2 - time)
    :precondition (and
                    (at ?t) (succ ?t ?t2)
                    (texture ?x2)
                    (next ?x1 ?x2) (vase ?x0 ?x1)
                  )
    :effect (and
              (not (at ?t)) (at ?t2)
              (next ?x0 ?x2)
              (not (vase ?x0 ?x1))
            )
  )
)