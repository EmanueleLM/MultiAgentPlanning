(define (domain Logistics13)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj stage)

  (:predicates
    (hand ?x - obj)
    (cats ?x - obj)
    (sneeze ?x - obj)
    (stupendous ?x - obj)
    (texture ?x - obj)
    (spring ?x - obj)
    (vase ?x - obj ?y - obj)
    (next ?x - obj ?y - obj)
    (collect ?x - obj ?y - obj)
    ;; explicit discrete-time / stage progression
    (succ ?s1 - stage ?s2 - stage)
    (current ?s - stage)
  )

  ;; Each action must be executed at the current stage and advances current to a successor stage.
  ;; paltry: hand X, cats Y, texture Z, vase X Y, next Y Z -> next X Z, not vase X Y
  (:action paltry
    :parameters (?x - obj ?y - obj ?z - obj ?t - stage ?t2 - stage)
    :precondition (and
      (current ?t)
      (succ ?t ?t2)
      (hand ?x)
      (cats ?y)
      (texture ?z)
      (vase ?x ?y)
      (next ?y ?z)
    )
    :effect (and
      (not (current ?t))
      (current ?t2)
      (next ?x ?z)
      (not (vase ?x ?y))
    )
  )

  ;; sip: hand X, cats Y, texture Z, next X Z, next Y Z -> vase X Y, not next X Z
  (:action sip
    :parameters (?x - obj ?y - obj ?z - obj ?t - stage ?t2 - stage)
    :precondition (and
      (current ?t)
      (succ ?t ?t2)
      (hand ?x)
      (cats ?y)
      (texture ?z)
      (next ?x ?z)
      (next ?y ?z)
    )
    :effect (and
      (not (current ?t))
      (current ?t2)
      (vase ?x ?y)
      (not (next ?x ?z))
    )
  )

  ;; clip: hand X, sneeze Y, texture Z, next Y Z, next X Z -> vase X Y, not next X Z
  (:action clip
    :parameters (?x - obj ?y - obj ?z - obj ?t - stage ?t2 - stage)
    :precondition (and
      (current ?t)
      (succ ?t ?t2)
      (hand ?x)
      (sneeze ?y)
      (texture ?z)
      (next ?y ?z)
      (next ?x ?z)
    )
    :effect (and
      (not (current ?t))
      (current ?t2)
      (vase ?x ?y)
      (not (next ?x ?z))
    )
  )

  ;; wretched: sneeze X, texture Y, texture Z, stupendous W, next X Y, collect Y W, collect Z W
  ;; -> next X Z, not next X Y
  (:action wretched
    :parameters (?x - obj ?y - obj ?z - obj ?w - obj ?t - stage ?t2 - stage)
    :precondition (and
      (current ?t)
      (succ ?t ?t2)
      (sneeze ?x)
      (texture ?y)
      (texture ?z)
      (stupendous ?w)
      (next ?x ?y)
      (collect ?y ?w)
      (collect ?z ?w)
    )
    :effect (and
      (not (current ?t))
      (current ?t2)
      (next ?x ?z)
      (not (next ?x ?y))
    )
  )

  ;; memory: cats X, spring Y, spring Z, next X Y -> next X Z, not next X Y
  (:action memory
    :parameters (?x - obj ?y - obj ?z - obj ?t - stage ?t2 - stage)
    :precondition (and
      (current ?t)
      (succ ?t ?t2)
      (cats ?x)
      (spring ?y)
      (spring ?z)
      (next ?x ?y)
    )
    :effect (and
      (not (current ?t))
      (current ?t2)
      (next ?x ?z)
      (not (next ?x ?y))
    )
  )

  ;; tightfisted: hand X, sneeze Y, texture Z, next Y Z, vase X Y -> next X Z, not vase X Y
  (:action tightfisted
    :parameters (?x - obj ?y - obj ?z - obj ?t - stage ?t2 - stage)
    :precondition (and
      (current ?t)
      (succ ?t ?t2)
      (hand ?x)
      (sneeze ?y)
      (texture ?z)
      (next ?y ?z)
      (vase ?x ?y)
    )
    :effect (and
      (not (current ?t))
      (current ?t2)
      (next ?x ?z)
      (not (vase ?x ?y))
    )
  )

)