(define (domain MysteryBlocksworld9)
  (:requirements :strips :typing :negative-preconditions)
  (:types thing)
  (:predicates
    (hand ?x - thing)
    (cats ?x - thing)
    (texture ?x - thing)
    (vase ?x - thing ?y - thing)
    (next ?x - thing ?y - thing)
    (collect ?x - thing ?y - thing)
    (sneeze ?x - thing)
    (spring ?x - thing)
    (stupendous ?x - thing)
  )

  ;; paltry: requires hand X, cats Y, texture Z, vase X Y, next Y Z
  ;; effect: next X Z true, vase X Y false
  (:action paltry
    :parameters (?x - thing ?y - thing ?z - thing)
    :precondition (and
      (hand ?x)
      (cats ?y)
      (texture ?z)
      (vase ?x ?y)
      (next ?y ?z)
    )
    :effect (and
      (next ?x ?z)
      (not (vase ?x ?y))
    )
  )

  ;; sip: requires hand X, cats Y, texture Z, next X Z, next Y Z
  ;; effect: vase X Y true, next X Z false
  (:action sip
    :parameters (?x - thing ?y - thing ?z - thing)
    :precondition (and
      (hand ?x)
      (cats ?y)
      (texture ?z)
      (next ?x ?z)
      (next ?y ?z)
    )
    :effect (and
      (vase ?x ?y)
      (not (next ?x ?z))
    )
  )

  ;; clip: requires hand X, sneeze Y, texture Z, next Y Z, next X Z
  ;; effect: vase X Y true, next X Z false
  (:action clip
    :parameters (?x - thing ?y - thing ?z - thing)
    :precondition (and
      (hand ?x)
      (sneeze ?y)
      (texture ?z)
      (next ?y ?z)
      (next ?x ?z)
    )
    :effect (and
      (vase ?x ?y)
      (not (next ?x ?z))
    )
  )

  ;; wretched: requires sneeze X, texture Y, texture Z, stupendous W,
  ;; next X Y, collect Y W, collect Z W
  ;; effect: next X Z true, next X Y false
  (:action wretched
    :parameters (?x - thing ?y - thing ?z - thing ?w - thing)
    :precondition (and
      (sneeze ?x)
      (texture ?y)
      (texture ?z)
      (stupendous ?w)
      (next ?x ?y)
      (collect ?y ?w)
      (collect ?z ?w)
    )
    :effect (and
      (next ?x ?z)
      (not (next ?x ?y))
    )
  )

  ;; memory: requires cats X, spring Y, spring Z, next X Y
  ;; effect: next X Z true, next X Y false
  (:action memory
    :parameters (?x - thing ?y - thing ?z - thing)
    :precondition (and
      (cats ?x)
      (spring ?y)
      (spring ?z)
      (next ?x ?y)
    )
    :effect (and
      (next ?x ?z)
      (not (next ?x ?y))
    )
  )

  ;; tightfisted: requires hand X, sneeze Y, texture Z, next Y Z, vase X Y
  ;; effect: next X Z true, vase X Y false
  (:action tightfisted
    :parameters (?x - thing ?y - thing ?z - thing)
    :precondition (and
      (hand ?x)
      (sneeze ?y)
      (texture ?z)
      (next ?y ?z)
      (vase ?x ?y)
    )
    :effect (and
      (next ?x ?z)
      (not (vase ?x ?y))
    )
  )
)