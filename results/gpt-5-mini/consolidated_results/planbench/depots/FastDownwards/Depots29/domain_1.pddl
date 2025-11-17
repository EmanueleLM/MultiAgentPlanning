(define (domain Depots29)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)
  (:predicates
    (hand ?o - obj)
    (cats ?o - obj)
    (texture ?o - obj)
    (vase ?x - obj ?y - obj)
    (next ?x - obj ?y - obj)
    (sneeze ?o - obj)
    (stupendous ?o - obj)
    (collect ?x - obj ?y - obj)
    (spring ?o - obj)
  )

  ;; paltry: requires hand X, cats Y, texture Z, vase X Y, next Y Z
  ;; effects: add next X Z, del vase X Y
  (:action paltry
    :parameters (?x - obj ?y - obj ?z - obj)
    :precondition (and (hand ?x) (cats ?y) (texture ?z) (vase ?x ?y) (next ?y ?z))
    :effect (and (next ?x ?z) (not (vase ?x ?y)))
  )

  ;; sip: requires hand X, cats Y, texture Z, next X Z, next Y Z
  ;; effects: add vase X Y, del next X Z
  (:action sip
    :parameters (?x - obj ?y - obj ?z - obj)
    :precondition (and (hand ?x) (cats ?y) (texture ?z) (next ?x ?z) (next ?y ?z))
    :effect (and (vase ?x ?y) (not (next ?x ?z)))
  )

  ;; clip: requires hand X, sneeze Y, texture Z, next Y Z, next X Z
  ;; effects: add vase X Y, del next X Z
  (:action clip
    :parameters (?x - obj ?y - obj ?z - obj)
    :precondition (and (hand ?x) (sneeze ?y) (texture ?z) (next ?y ?z) (next ?x ?z))
    :effect (and (vase ?x ?y) (not (next ?x ?z)))
  )

  ;; wretched: requires sneeze X, texture Y, texture Z, stupendous W, next X Y, collect Y W, collect Z W
  ;; effects: add next X Z, del next X Y
  (:action wretched
    :parameters (?x - obj ?y - obj ?z - obj ?w - obj)
    :precondition (and (sneeze ?x) (texture ?y) (texture ?z) (stupendous ?w) (next ?x ?y) (collect ?y ?w) (collect ?z ?w))
    :effect (and (next ?x ?z) (not (next ?x ?y)))
  )

  ;; memory: requires cats X, spring Y, spring Z, next X Y
  ;; effects: add next X Z, del next X Y
  (:action memory
    :parameters (?x - obj ?y - obj ?z - obj)
    :precondition (and (cats ?x) (spring ?y) (spring ?z) (next ?x ?y))
    :effect (and (next ?x ?z) (not (next ?x ?y)))
  )

  ;; tightfisted: requires hand X, sneeze Y, texture Z, next Y Z, vase X Y
  ;; effects: add next X Z, del vase X Y
  (:action tightfisted
    :parameters (?x - obj ?y - obj ?z - obj)
    :precondition (and (hand ?x) (sneeze ?y) (texture ?z) (next ?y ?z) (vase ?x ?y))
    :effect (and (next ?x ?z) (not (vase ?x ?y)))
  )
)