(define (domain integrated-domain)
  (:requirements :strips)
  (:predicates
    (hand ?x)
    (cats ?x)
    (sneeze ?x)
    (spring ?x)
    (stupendous ?x)
    (texture ?x)
    (next ?x ?y)
    (vase ?x)
    (collect ?x)
  )

  (:action paltry
    :parameters (?x)
    :precondition (texture ?x)
    :effect (and
      (hand ?x)
      (not (texture ?x))
    )
  )

  (:action wretched
    :parameters (?x)
    :precondition (hand ?x)
    :effect (and
      (sneeze ?x)
    )
  )

  (:action memory
    :parameters (?x)
    :precondition (vase ?x)
    :effect (and
      (spring ?x)
      (not (vase ?x))
    )
  )

  (:action sip
    :parameters (?x)
    :precondition (spring ?x)
    :effect (and
      (cats ?x)
      (not (spring ?x))
    )
  )

  (:action tightfisted
    :parameters (?x ?y)
    :precondition (and
      (sneeze ?x)
      (cats ?y)
    )
    :effect (and
      (stupendous ?x)
      (stupendous ?y)
    )
  )

  (:action clip
    :parameters (?x ?y)
    :precondition (and
      (stupendous ?x)
      (stupendous ?y)
      (collect ?x)
      (collect ?y)
    )
    :effect (and
      (next ?x ?y)
      (not (collect ?x))
      (not (collect ?y))
    )
  )
)