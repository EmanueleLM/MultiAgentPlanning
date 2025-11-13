(define (domain ObfuscatedDeceptiveLogistics21)
  (:requirements :strips :typing :negative-preconditions)
  (:types object)
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
  )

  ;; paltry: pre: hand X, cats Y, texture Z, vase X Y, next Y Z
  ;;         add: next X Z
  ;;         del: vase X Y
  (:action paltry
    :parameters (?x - object ?y - object ?z - object)
    :precondition (and (hand ?x) (cats ?y) (texture ?z) (vase ?x ?y) (next ?y ?z))
    :effect (and (next ?x ?z) (not (vase ?x ?y)))
  )

  ;; sip: pre: hand X, cats Y, texture Z, next X Z, next Y Z
  ;;      add: vase X Y
  ;;      del: next X Z
  (:action sip
    :parameters (?x - object ?y - object ?z - object)
    :precondition (and (hand ?x) (cats ?y) (texture ?z) (next ?x ?z) (next ?y ?z))
    :effect (and (vase ?x ?y) (not (next ?x ?z)))
  )

  ;; clip: pre: hand X, sneeze Y, texture Z, next Y Z, next X Z
  ;;       add: vase X Y
  ;;       del: next X Z
  (:action clip
    :parameters (?x - object ?y - object ?z - object)
    :precondition (and (hand ?x) (sneeze ?y) (texture ?z) (next ?y ?z) (next ?x ?z))
    :effect (and (vase ?x ?y) (not (next ?x ?z)))
  )

  ;; wretched: pre: sneeze X, texture Y, texture Z, stupendous W, next X Y, collect Y W, collect Z W
  ;;           add: next X Z
  ;;           del: next X Y
  (:action wretched
    :parameters (?x - object ?y - object ?z - object ?w - object)
    :precondition (and (sneeze ?x) (texture ?y) (texture ?z) (stupendous ?w) (next ?x ?y) (collect ?y ?w) (collect ?z ?w))
    :effect (and (next ?x ?z) (not (next ?x ?y)))
  )

  ;; memory: pre: cats X, spring Y, spring Z, next X Y
  ;;         add: next X Z
  ;;         del: next X Y
  (:action memory
    :parameters (?x - object ?y - object ?z - object)
    :precondition (and (cats ?x) (spring ?y) (spring ?z) (next ?x ?y))
    :effect (and (next ?x ?z) (not (next ?x ?y)))
  )

  ;; tightfisted: pre: hand X, sneeze Y, texture Z, next Y Z, vase X Y
  ;;              add: next X Z
  ;;              del: vase X Y
  (:action tightfisted
    :parameters (?x - object ?y - object ?z - object)
    :precondition (and (hand ?x) (sneeze ?y) (texture ?z) (next ?y ?z) (vase ?x ?y))
    :effect (and (next ?x ?z) (not (vase ?x ?y)))
  )
)