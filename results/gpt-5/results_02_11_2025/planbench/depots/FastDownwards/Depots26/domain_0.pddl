(define (domain public-action-model)
  (:requirements :strips)
  (:predicates
    (hand ?x)
    (cats ?x)
    (sneeze ?x)
    (spring ?x)
    (texture ?x)
    (stupendous ?x)
    (vase ?x ?y)
    (next ?x ?y)
    (collect ?x ?y)
  )

  (:action paltry
    :parameters (?x ?y ?z)
    :precondition (and
      (hand ?x)
      (cats ?y)
      (next ?y ?z)
    )
    :effect (and
      (collect ?x ?z)
      (sneeze ?y)
      (not (next ?y ?z))
    )
  )

  (:action sip
    :parameters (?x ?y ?z)
    :precondition (and
      (collect ?x ?y)
      (spring ?z)
    )
    :effect (and
      (texture ?x)
      (vase ?y ?z)
      (not (collect ?x ?y))
    )
  )

  (:action clip
    :parameters (?x ?y ?z)
    :precondition (and
      (vase ?y ?z)
      (hand ?x)
    )
    :effect (and
      (stupendous ?z)
      (next ?x ?y)
      (not (vase ?y ?z))
    )
  )

  (:action wretched
    :parameters (?x ?y ?z ?w)
    :precondition (and
      (next ?x ?y)
      (next ?y ?z)
    )
    :effect (and
      (next ?x ?z)
      (cats ?w)
      (not (next ?x ?y))
    )
  )

  (:action memory
    :parameters (?x ?y ?z)
    :precondition (and
      (texture ?x)
      (sneeze ?y)
    )
    :effect (and
      (spring ?z)
      (hand ?y)
      (not (sneeze ?y))
    )
  )

  (:action tightfisted
    :parameters (?x ?y ?z)
    :precondition (and
      (stupendous ?x)
      (hand ?y)
    )
    :effect (and
      (cats ?z)
      (collect ?y ?z)
      (not (hand ?y))
    )
  )
)