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
    ;; explicit stage progression predicates to enforce ordered stages
    (current ?s - stage)
    (succ ?s1 - stage ?s2 - stage)
  )

  ;; Each action requires a current stage ?s1 and a successor ?s2 (succ ?s1 ?s2).
  ;; Performing the action consumes current ?s1 and makes current ?s2, enforcing strict sequential progression.

  ;; paltry: pre: hand X, cats Y, texture Z, vase X Y, next Y Z, current ?s1, succ ?s1 ?s2
  ;;         add: next X Z, current ?s2
  ;;         del: vase X Y, current ?s1
  (:action paltry
    :parameters (?x - object ?y - object ?z - object ?s1 - stage ?s2 - stage)
    :precondition (and (hand ?x) (cats ?y) (texture ?z) (vase ?x ?y) (next ?y ?z) (current ?s1) (succ ?s1 ?s2))
    :effect (and (next ?x ?z) (not (vase ?x ?y)) (not (current ?s1)) (current ?s2))
  )

  ;; sip: pre: hand X, cats Y, texture Z, next X Z, next Y Z, current ?s1, succ ?s1 ?s2
  ;;      add: vase X Y, current ?s2
  ;;      del: next X Z, current ?s1
  (:action sip
    :parameters (?x - object ?y - object ?z - object ?s1 - stage ?s2 - stage)
    :precondition (and (hand ?x) (cats ?y) (texture ?z) (next ?x ?z) (next ?y ?z) (current ?s1) (succ ?s1 ?s2))
    :effect (and (vase ?x ?y) (not (next ?x ?z)) (not (current ?s1)) (current ?s2))
  )

  ;; clip: pre: hand X, sneeze Y, texture Z, next Y Z, next X Z, current ?s1, succ ?s1 ?s2
  ;;       add: vase X Y, current ?s2
  ;;       del: next X Z, current ?s1
  (:action clip
    :parameters (?x - object ?y - object ?z - object ?s1 - stage ?s2 - stage)
    :precondition (and (hand ?x) (sneeze ?y) (texture ?z) (next ?y ?z) (next ?x ?z) (current ?s1) (succ ?s1 ?s2))
    :effect (and (vase ?x ?y) (not (next ?x ?z)) (not (current ?s1)) (current ?s2))
  )

  ;; wretched: pre: sneeze X, texture Y, texture Z, stupendous W, next X Y, collect Y W, collect Z W, current ?s1, succ ?s1 ?s2
  ;;           add: next X Z, current ?s2
  ;;           del: next X Y, current ?s1
  (:action wretched
    :parameters (?x - object ?y - object ?z - object ?w - object ?s1 - stage ?s2 - stage)
    :precondition (and (sneeze ?x) (texture ?y) (texture ?z) (stupendous ?w) (next ?x ?y) (collect ?y ?w) (collect ?z ?w) (current ?s1) (succ ?s1 ?s2))
    :effect (and (next ?x ?z) (not (next ?x ?y)) (not (current ?s1)) (current ?s2))
  )

  ;; memory: pre: cats X, spring Y, spring Z, next X Y, current ?s1, succ ?s1 ?s2
  ;;         add: next X Z, current ?s2
  ;;         del: next X Y, current ?s1
  (:action memory
    :parameters (?x - object ?y - object ?z - object ?s1 - stage ?s2 - stage)
    :precondition (and (cats ?x) (spring ?y) (spring ?z) (next ?x ?y) (current ?s1) (succ ?s1 ?s2))
    :effect (and (next ?x ?z) (not (next ?x ?y)) (not (current ?s1)) (current ?s2))
  )

  ;; tightfisted: pre: hand X, sneeze Y, texture Z, next Y Z, vase X Y, current ?s1, succ ?s1 ?s2
  ;;              add: next X Z, current ?s2
  ;;              del: vase X Y, current ?s1
  (:action tightfisted
    :parameters (?x - object ?y - object ?z - object ?s1 - stage ?s2 - stage)
    :precondition (and (hand ?x) (sneeze ?y) (texture ?z) (next ?y ?z) (vase ?x ?y) (current ?s1) (succ ?s1 ?s2))
    :effect (and (next ?x ?z) (not (vase ?x ?y)) (not (current ?s1)) (current ?s2))
  )
)