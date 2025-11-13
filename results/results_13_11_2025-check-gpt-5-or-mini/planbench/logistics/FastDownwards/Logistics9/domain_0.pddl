(define (domain logistics9)
  (:requirements :strips)
  (:predicates
    (hand ?x)
    (cats ?x)
    (sneeze ?x)
    (spring ?x)
    (stupendous ?x)
    (texture ?x)
    (next ?x ?y)
    (vase ?x ?y)
    (collect ?x ?y)
  )

  (:action paltry
    :parameters (?x)
    :precondition (and
      (texture ?x)
    )
    :effect (and
      (hand ?x)
    )
  )

  (:action sip
    :parameters (?x)
    :precondition (and
      (hand ?x)
    )
    :effect (and
      (cats ?x)
    )
  )

  (:action wretched
    :parameters (?x)
    :precondition (and
      (cats ?x)
    )
    :effect (and
      (sneeze ?x)
    )
  )

  (:action memory
    :parameters (?x ?y)
    :precondition (and
      (next ?x ?y)
      (spring ?x)
    )
    :effect (and
      (spring ?y)
    )
  )

  (:action clip
    :parameters (?x ?y)
    :precondition (and
      (next ?x ?y)
      (hand ?x)
    )
    :effect (and
      (hand ?y)
      (vase ?x ?y)
      (collect ?x ?y)
      (not (hand ?x))
    )
  )

  (:action tightfisted
    :parameters (?x)
    :precondition (and
      (spring ?x)
    )
    :effect (and
      (stupendous ?x)
    )
  )
)