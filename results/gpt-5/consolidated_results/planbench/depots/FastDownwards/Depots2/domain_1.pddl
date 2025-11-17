(define (domain depots2)
  (:requirements :strips :typing)
  (:types obj)
  (:predicates
    (hand ?x0 - obj)
    (cats ?x0 - obj)
    (texture ?x0 - obj)
    (vase ?x0 - obj ?x1 - obj)
    (next ?x0 - obj ?x1 - obj)
    (sneeze ?x0 - obj)
    (spring ?x0 - obj)
    (stupendous ?x0 - obj)
    (collect ?x0 - obj ?x1 - obj)
  )

  (:action Paltry
    :parameters (?x0 - obj ?x1 - obj ?x2 - obj)
    :precondition (and
      (hand ?x0)
      (cats ?x1)
      (texture ?x2)
      (vase ?x0 ?x1)
      (next ?x1 ?x2)
    )
    :effect (and
      (next ?x0 ?x2)
      (not (vase ?x0 ?x1))
    )
  )

  (:action Sip
    :parameters (?x0 - obj ?x1 - obj ?x2 - obj)
    :precondition (and
      (hand ?x0)
      (cats ?x1)
      (texture ?x2)
      (next ?x0 ?x2)
      (next ?x1 ?x2)
    )
    :effect (and
      (vase ?x0 ?x1)
      (not (next ?x0 ?x2))
    )
  )

  (:action Clip
    :parameters (?x0 - obj ?x1 - obj ?x2 - obj)
    :precondition (and
      (hand ?x0)
      (sneeze ?x1)
      (texture ?x2)
      (next ?x1 ?x2)
      (next ?x0 ?x2)
    )
    :effect (and
      (vase ?x0 ?x1)
      (not (next ?x0 ?x2))
    )
  )

  (:action Wretched
    :parameters (?x0 - obj ?x1 - obj ?x2 - obj ?x3 - obj)
    :precondition (and
      (sneeze ?x0)
      (texture ?x1)
      (texture ?x2)
      (stupendous ?x3)
      (next ?x0 ?x1)
      (collect ?x1 ?x3)
      (collect ?x2 ?x3)
    )
    :effect (and
      (next ?x0 ?x2)
      (not (next ?x0 ?x1))
    )
  )

  (:action Memory
    :parameters (?x0 - obj ?x1 - obj ?x2 - obj)
    :precondition (and
      (cats ?x0)
      (spring ?x1)
      (spring ?x2)
      (next ?x0 ?x1)
    )
    :effect (and
      (next ?x0 ?x2)
      (not (next ?x0 ?x1))
    )
  )

  (:action Tightfisted
    :parameters (?x0 - obj ?x1 - obj ?x2 - obj)
    :precondition (and
      (hand ?x0)
      (sneeze ?x1)
      (texture ?x2)
      (next ?x1 ?x2)
      (vase ?x0 ?x1)
    )
    :effect (and
      (next ?x0 ?x2)
      (not (vase ?x0 ?x1))
    )
  )
)