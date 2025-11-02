(define (domain Logistics10)
  (:requirements :strips :typing :negative-preconditions)
  (:types object)

  (:predicates
    (cats ?o - object)
    (hand ?o - object)
    (texture ?o - object)
    (sneeze ?o - object)
    (spring ?o - object)
    (stupendous ?o - object)
    (collect ?o1 ?o2 - object)
    (vase ?o1 ?o2 - object)
    (next ?o1 ?o2 - object)
  )

  ;; paltry: requires hand X, cats Y, texture Z, vase X Y, next Y Z
  ;; effects: add next X Z, remove vase X Y
  (:action paltry
    :parameters (?x - object ?y - object ?z - object)
    :precondition (and (hand ?x) (cats ?y) (texture ?z) (vase ?x ?y) (next ?y ?z))
    :effect (and (next ?x ?z) (not (vase ?x ?y)))
  )

  ;; sip: requires hand X, cats Y, texture Z, next X Z, next Y Z
  ;; effects: add vase X Y, remove next X Z
  (:action sip
    :parameters (?x - object ?y - object ?z - object)
    :precondition (and (hand ?x) (cats ?y) (texture ?z) (next ?x ?z) (next ?y ?z))
    :effect (and (vase ?x ?y) (not (next ?x ?z)))
  )

  ;; clip: requires hand X, sneeze Y, texture Z, next Y Z, next X Z
  ;; effects: add vase X Y, remove next X Z
  (:action clip
    :parameters (?x - object ?y - object ?z - object)
    :precondition (and (hand ?x) (sneeze ?y) (texture ?z) (next ?y ?z) (next ?x ?z))
    :effect (and (vase ?x ?y) (not (next ?x ?z)))
  )

  ;; wretched: requires sneeze X, texture Y, texture Z, stupendous W, next X Y, collect Y W, collect Z W
  ;; effects: add next X Z, remove next X Y
  (:action wretched
    :parameters (?x - object ?y - object ?z - object ?w - object)
    :precondition (and (sneeze ?x) (texture ?y) (texture ?z) (stupendous ?w) (next ?x ?y) (collect ?y ?w) (collect ?z ?w))
    :effect (and (next ?x ?z) (not (next ?x ?y)))
  )

  ;; memory: requires cats X, spring Y, spring Z, next X Y
  ;; effects: add next X Z, remove next X Y
  (:action memory
    :parameters (?x - object ?y - object ?z - object)
    :precondition (and (cats ?x) (spring ?y) (spring ?z) (next ?x ?y))
    :effect (and (next ?x ?z) (not (next ?x ?y)))
  )

  ;; tightfisted: requires hand X, sneeze Y, texture Z, next Y Z, vase X Y
  ;; effects: add next X Z, remove vase X Y
  (:action tightfisted
    :parameters (?x - object ?y - object ?z - object)
    :precondition (and (hand ?x) (sneeze ?y) (texture ?z) (next ?y ?z) (vase ?x ?y))
    :effect (and (next ?x ?z) (not (vase ?x ?y)))
  )
)