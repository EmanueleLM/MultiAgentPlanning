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

  ;; paltry: requires hand X, cats Y, texture Z, vase X Y, next Y Z
  ;; effects: add next X Z, remove vase X Y
  (:action paltry
    :parameters (?x - object ?y - object ?z - object ?s1 - stage ?s2 - stage)
    :precondition (and (hand ?x) (cats ?y) (texture ?z) (vase ?x ?y) (next ?y ?z) (current ?s1) (succ ?s1 ?s2))
    :effect (and (next ?x ?z) (not (vase ?x ?y)) (not (current ?s1)) (current ?s2))
  )

  ;; sip: requires hand X, cats Y, texture Z, next X Z, next Y Z
  ;; effects: add vase X Y, remove next X Z
  (:action sip
    :parameters (?x - object ?y - object ?z - object ?s1 - stage ?s2 - stage)
    :precondition (and (hand ?x) (cats ?y) (texture ?z) (next ?x ?z) (next ?y ?z) (current ?s1) (succ ?s1 ?s2))
    :effect (and (vase ?x ?y) (not (next ?x ?z)) (not (current ?s1)) (current ?s2))
  )

  ;; clip: requires hand X, sneeze Y, texture Z, next Y Z, next X Z
  ;; effects: add vase X Y, remove next X Z
  (:action clip
    :parameters (?x - object ?y - object ?z - object ?s1 - stage ?s2 - stage)
    :precondition (and (hand ?x) (sneeze ?y) (texture ?z) (next ?y ?z) (next ?x ?z) (current ?s1) (succ ?s1 ?s2))
    :effect (and (vase ?x ?y) (not (next ?x ?z)) (not (current ?s1)) (current ?s2))
  )

  ;; wretched: requires sneeze X, texture Y, texture Z, stupendous W,
  ;;            next X Y, collect Y W, collect Z W
  ;; effects: add next X Z, remove next X Y
  (:action wretched
    :parameters (?x - object ?y - object ?z - object ?w - object ?s1 - stage ?s2 - stage)
    :precondition (and (sneeze ?x) (texture ?y) (texture ?z) (stupendous ?w) (next ?x ?y) (collect ?y ?w) (collect ?z ?w) (current ?s1) (succ ?s1 ?s2))
    :effect (and (next ?x ?z) (not (next ?x ?y)) (not (current ?s1)) (current ?s2))
  )

  ;; memory: requires cats X, spring Y, spring Z, next X Y
  ;; effects: add next X Z, remove next X Y
  (:action memory
    :parameters (?x - object ?y - object ?z - object ?s1 - stage ?s2 - stage)
    :precondition (and (cats ?x) (spring ?y) (spring ?z) (next ?x ?y) (current ?s1) (succ ?s1 ?s2))
    :effect (and (next ?x ?z) (not (next ?x ?y)) (not (current ?s1)) (current ?s2))
  )

  ;; tightfisted: requires hand X, sneeze Y, texture Z, next Y Z, vase X Y
  ;; effects: add next X Z, remove vase X Y
  (:action tightfisted
    :parameters (?x - object ?y - object ?z - object ?s1 - stage ?s2 - stage)
    :precondition (and (hand ?x) (sneeze ?y) (texture ?z) (next ?y ?z) (vase ?x ?y) (current ?s1) (succ ?s1 ?s2))
    :effect (and (next ?x ?z) (not (vase ?x ?y)) (not (current ?s1)) (current ?s2))
  )
)