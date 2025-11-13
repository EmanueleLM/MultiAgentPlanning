(define (domain ObfuscatedDeceptiveLogistics21)
  (:requirements :strips :typing :negative-preconditions)
  (:types object stage)
  (:predicates
    (hand ?o - object)
    (cats ?o - object)
    (sneeze ?o - object)
    (spring ?o - object)
    (stupendous ?o - object)
    (texture ?o - object)
    (collect ?o - object ?w - object)
    (next ?o - object ?p - object)
    (vase ?o - object ?y - object)
    (current ?s - stage)
    (succ ?s1 - stage ?s2 - stage)
  )

  ;; Each action consumes the current stage and advances to its successor stage.
  ;; This enforces strict, contiguous stage occupancy: an action is applicable only
  ;; at the explicit current stage, and its effect moves the unique 'current' marker
  ;; to the successor stage (removing the previous current).
  (:action paltry
    :parameters (?x - object ?y - object ?z - object ?s1 - stage ?s2 - stage)
    :precondition (and (hand ?x) (cats ?y) (texture ?z) (vase ?x ?y) (next ?y ?z) (current ?s1) (succ ?s1 ?s2))
    :effect (and (next ?x ?z) (not (vase ?x ?y)) (not (current ?s1)) (current ?s2))
  )

  (:action sip
    :parameters (?x - object ?y - object ?z - object ?s1 - stage ?s2 - stage)
    :precondition (and (hand ?x) (cats ?y) (texture ?z) (next ?x ?z) (next ?y ?z) (current ?s1) (succ ?s1 ?s2))
    :effect (and (vase ?x ?y) (not (next ?x ?z)) (not (current ?s1)) (current ?s2))
  )

  (:action clip
    :parameters (?x - object ?y - object ?z - object ?s1 - stage ?s2 - stage)
    :precondition (and (hand ?x) (sneeze ?y) (texture ?z) (next ?y ?z) (next ?x ?z) (current ?s1) (succ ?s1 ?s2))
    :effect (and (vase ?x ?y) (not (next ?x ?z)) (not (current ?s1)) (current ?s2))
  )

  (:action wretched
    :parameters (?x - object ?y - object ?z - object ?w - object ?s1 - stage ?s2 - stage)
    :precondition (and (sneeze ?x) (texture ?y) (texture ?z) (stupendous ?w) (next ?x ?y) (collect ?y ?w) (collect ?z ?w) (current ?s1) (succ ?s1 ?s2))
    :effect (and (next ?x ?z) (not (next ?x ?y)) (not (current ?s1)) (current ?s2))
  )

  (:action memory
    :parameters (?x - object ?y - object ?z - object ?s1 - stage ?s2 - stage)
    :precondition (and (cats ?x) (spring ?y) (spring ?z) (next ?x ?y) (current ?s1) (succ ?s1 ?s2))
    :effect (and (next ?x ?z) (not (next ?x ?y)) (not (current ?s1)) (current ?s2))
  )

  (:action tightfisted
    :parameters (?x - object ?y - object ?z - object ?s1 - stage ?s2 - stage)
    :precondition (and (hand ?x) (sneeze ?y) (texture ?z) (next ?y ?z) (vase ?x ?y) (current ?s1) (succ ?s1 ?s2))
    :effect (and (next ?x ?z) (not (vase ?x ?y)) (not (current ?s1)) (current ?s2))
  )
)