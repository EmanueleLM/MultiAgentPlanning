(define (domain Depots19)
  (:requirements :strips :typing :negative-preconditions)
  (:predicates
    (hand ?x)
    (cats ?x)
    (sneeze ?x)
    (spring ?x)
    (texture ?x)
    (stupendous ?x)
    (collect ?x ?y)
    (vase ?x ?y)
    (next ?x ?y)
  )

  (:action paltry
    :parameters (?object_0 ?object_1 ?object_2)
    :precondition (and
      (hand ?object_0)
      (cats ?object_1)
      (texture ?object_2)
      (vase ?object_0 ?object_1)
      (next ?object_1 ?object_2)
    )
    :effect (and
      (next ?object_0 ?object_2)
      (not (vase ?object_0 ?object_1))
    )
  )

  (:action sip
    :parameters (?object_0 ?object_1 ?object_2)
    :precondition (and
      (hand ?object_0)
      (cats ?object_1)
      (texture ?object_2)
      (next ?object_0 ?object_2)
      (next ?object_1 ?object_2)
    )
    :effect (and
      (vase ?object_0 ?object_1)
      (not (next ?object_0 ?object_2))
    )
  )

  (:action clip
    :parameters (?object_0 ?object_1 ?object_2)
    :precondition (and
      (hand ?object_0)
      (sneeze ?object_1)
      (texture ?object_2)
      (next ?object_1 ?object_2)
      (next ?object_0 ?object_2)
    )
    :effect (and
      (vase ?object_0 ?object_1)
      (not (next ?object_0 ?object_2))
    )
  )

  (:action wretched
    :parameters (?object_0 ?object_1 ?object_2 ?object_3)
    :precondition (and
      (sneeze ?object_0)
      (texture ?object_1)
      (texture ?object_2)
      (stupendous ?object_3)
      (next ?object_0 ?object_1)
      (collect ?object_1 ?object_3)
      (collect ?object_2 ?object_3)
    )
    :effect (and
      (next ?object_0 ?object_2)
      (not (next ?object_0 ?object_1))
    )
  )

  (:action memory
    :parameters (?object_0 ?object_1 ?object_2)
    :precondition (and
      (cats ?object_0)
      (spring ?object_1)
      (spring ?object_2)
      (next ?object_0 ?object_1)
    )
    :effect (and
      (next ?object_0 ?object_2)
      (not (next ?object_0 ?object_1))
    )
  )

  (:action tightfisted
    :parameters (?object_0 ?object_1 ?object_2)
    :precondition (and
      (hand ?object_0)
      (sneeze ?object_1)
      (texture ?object_2)
      (next ?object_1 ?object_2)
      (vase ?object_0 ?object_1)
    )
    :effect (and
      (next ?object_0 ?object_2)
      (not (vase ?object_0 ?object_1))
    )
  )
)