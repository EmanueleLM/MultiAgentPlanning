(define (domain Logistics13)
  (:requirements :strips :typing :negative-preconditions)
  (:types hand cat sneeze stupendous obj)

  (:predicates
    (texture ?x - obj)
    (spring ?x - obj)
    (vase ?x - obj ?y - obj)
    (next ?x - obj ?y - obj)
    (collect ?x - obj ?y - obj)
  )

  ;; paltry: hand X, cats Y, texture Z, vase X Y, next Y Z -> next X Z, not vase X Y
  (:action paltry
    :parameters (?x - hand ?y - cat ?z - obj)
    :precondition (and
      (texture ?z)
      (vase ?x ?y)
      (next ?y ?z)
    )
    :effect (and
      (next ?x ?z)
      (not (vase ?x ?y))
    )
  )

  ;; sip: hand X, cats Y, texture Z, next X Z, next Y Z -> vase X Y, not next X Z
  (:action sip
    :parameters (?x - hand ?y - cat ?z - obj)
    :precondition (and
      (texture ?z)
      (next ?x ?z)
      (next ?y ?z)
    )
    :effect (and
      (vase ?x ?y)
      (not (next ?x ?z))
    )
  )

  ;; clip: hand X, sneeze Y, texture Z, next Y Z, next X Z -> vase X Y, not next X Z
  (:action clip
    :parameters (?x - hand ?y - sneeze ?z - obj)
    :precondition (and
      (texture ?z)
      (next ?y ?z)
      (next ?x ?z)
    )
    :effect (and
      (vase ?x ?y)
      (not (next ?x ?z))
    )
  )

  ;; wretched: sneeze X, texture Y, texture Z, stupendous W, next X Y, collect Y W, collect Z W
  ;; -> next X Z, not next X Y
  (:action wretched
    :parameters (?x - sneeze ?y - obj ?z - obj ?w - stupendous)
    :precondition (and
      (texture ?y)
      (texture ?z)
      (next ?x ?y)
      (collect ?y ?w)
      (collect ?z ?w)
    )
    :effect (and
      (next ?x ?z)
      (not (next ?x ?y))
    )
  )

  ;; memory: cats X, spring Y, spring Z, next X Y -> next X Z, not next X Y
  (:action memory
    :parameters (?x - cat ?y - obj ?z - obj)
    :precondition (and
      (spring ?y)
      (spring ?z)
      (next ?x ?y)
    )
    :effect (and
      (next ?x ?z)
      (not (next ?x ?y))
    )
  )

  ;; tightfisted: hand X, sneeze Y, texture Z, next Y Z, vase X Y -> next X Z, not vase X Y
  (:action tightfisted
    :parameters (?x - hand ?y - sneeze ?z - obj)
    :precondition (and
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