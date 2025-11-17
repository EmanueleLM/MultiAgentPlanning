(define (domain linking)
  (:requirements :strips :typing :negative-preconditions)
  (:types object stage)
  (:predicates
    (hand ?x - object)
    (cats ?x - object)
    (texture ?x - object)
    (vase ?x - object ?y - object)
    (next ?x - object ?y - object)
    (sneeze ?x - object)
    (stupendous ?x - object)
    (collect ?x - object ?y - object)
    (spring ?x - object)
    (current-stage ?s - stage)
    (succ ?s1 - stage ?s2 - stage)
  )

  ;; paltry: pre: hand X, cats Y, texture Z, vase X Y, next Y Z
  ;; effects: add next X Z, del vase X Y
  (:action paltry
    :parameters (?x - object ?y - object ?z - object ?s1 - stage ?s2 - stage)
    :precondition (and
      (hand ?x)
      (cats ?y)
      (texture ?z)
      (vase ?x ?y)
      (next ?y ?z)
      (current-stage ?s1)
      (succ ?s1 ?s2)
    )
    :effect (and
      (next ?x ?z)
      (not (vase ?x ?y))
      (not (current-stage ?s1))
      (current-stage ?s2)
    )
  )

  ;; sip: pre: hand X, cats Y, texture Z, next X Z, next Y Z
  ;; effects: add vase X Y, del next X Z
  (:action sip
    :parameters (?x - object ?y - object ?z - object ?s1 - stage ?s2 - stage)
    :precondition (and
      (hand ?x)
      (cats ?y)
      (texture ?z)
      (next ?x ?z)
      (next ?y ?z)
      (current-stage ?s1)
      (succ ?s1 ?s2)
    )
    :effect (and
      (vase ?x ?y)
      (not (next ?x ?z))
      (not (current-stage ?s1))
      (current-stage ?s2)
    )
  )

  ;; clip: pre: hand X, sneeze Y, texture Z, next Y Z, next X Z
  ;; effects: add vase X Y, del next X Z
  (:action clip
    :parameters (?x - object ?y - object ?z - object ?s1 - stage ?s2 - stage)
    :precondition (and
      (hand ?x)
      (sneeze ?y)
      (texture ?z)
      (next ?y ?z)
      (next ?x ?z)
      (current-stage ?s1)
      (succ ?s1 ?s2)
    )
    :effect (and
      (vase ?x ?y)
      (not (next ?x ?z))
      (not (current-stage ?s1))
      (current-stage ?s2)
    )
  )

  ;; wretched: pre: sneeze X, texture Y, texture Z, stupendous W, next X Y, collect Y W, collect Z W
  ;; effects: add next X Z, del next X Y
  (:action wretched
    :parameters (?x - object ?y - object ?z - object ?w - object ?s1 - stage ?s2 - stage)
    :precondition (and
      (sneeze ?x)
      (texture ?y)
      (texture ?z)
      (stupendous ?w)
      (next ?x ?y)
      (collect ?y ?w)
      (collect ?z ?w)
      (current-stage ?s1)
      (succ ?s1 ?s2)
    )
    :effect (and
      (next ?x ?z)
      (not (next ?x ?y))
      (not (current-stage ?s1))
      (current-stage ?s2)
    )
  )

  ;; memory: pre: cats X, spring Y, spring Z, next X Y
  ;; effects: add next X Z, del next X Y
  (:action memory
    :parameters (?x - object ?y - object ?z - object ?s1 - stage ?s2 - stage)
    :precondition (and
      (cats ?x)
      (spring ?y)
      (spring ?z)
      (next ?x ?y)
      (current-stage ?s1)
      (succ ?s1 ?s2)
    )
    :effect (and
      (next ?x ?z)
      (not (next ?x ?y))
      (not (current-stage ?s1))
      (current-stage ?s2)
    )
  )

  ;; tightfisted: pre: hand X, sneeze Y, texture Z, next Y Z, vase X Y
  ;; effects: add next X Z, del vase X Y
  (:action tightfisted
    :parameters (?x - object ?y - object ?z - object ?s1 - stage ?s2 - stage)
    :precondition (and
      (hand ?x)
      (sneeze ?y)
      (texture ?z)
      (next ?y ?z)
      (vase ?x ?y)
      (current-stage ?s1)
      (succ ?s1 ?s2)
    )
    :effect (and
      (next ?x ?z)
      (not (vase ?x ?y))
      (not (current-stage ?s1))
      (current-stage ?s2)
    )
  )
)