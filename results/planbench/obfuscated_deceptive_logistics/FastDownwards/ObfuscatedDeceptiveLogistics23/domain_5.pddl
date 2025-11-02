(define (domain obfuscateddeceptivelogistics23)
  (:requirements :strips)
  (:predicates
    (hand ?x)
    (cats ?x)
    (sneeze ?x)
    (spring ?x)
    (stupendous ?x)
    (texture ?x)
    (collect ?x ?y)
    (next ?x ?y)
    (vase ?x ?y)
  )

  (:action paltry
    :parameters (?x ?y ?z)
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

  (:action sip
    :parameters (?x ?y ?z)
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

  (:action clip
    :parameters (?x ?y ?z)
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

  (:action wretched
    :parameters (?w ?x ?y ?z)
    :precondition (and
      (sneeze ?w)
      (texture ?x)
      (texture ?y)
      (stupendous ?z)
      (next ?w ?x)
      (collect ?x ?z)
      (collect ?y ?z)
    )
    :effect (and
      (next ?w ?y)
      (not (next ?w ?x))
    )
  )

  (:action memory
    :parameters (?x ?y ?z)
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

  (:action tightfisted
    :parameters (?x ?y ?z)
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