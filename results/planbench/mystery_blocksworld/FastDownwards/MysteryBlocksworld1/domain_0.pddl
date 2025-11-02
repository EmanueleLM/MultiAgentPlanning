(define (domain scenario-b)
  (:requirements :strips :typing)
  (:predicates
    (cats ?x - object)
    (hand ?x - object)
    (sneeze ?x - object)
    (texture ?x - object)
    (stupendous ?x - object)
    (spring ?x - object)
    (collect ?x - object ?y - object)
    (vase ?x - object ?y - object)
    (next ?x - object ?y - object)
  )

  (:action paltry
    :parameters (?x - object ?y - object ?z - object)
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
    :parameters (?x - object ?y - object ?z - object)
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
    :parameters (?x - object ?y - object ?z - object)
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
    :parameters (?w - object ?x - object ?y - object ?z - object)
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
    :parameters (?x - object ?y - object ?z - object)
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
    :parameters (?x - object ?y - object ?z - object)
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