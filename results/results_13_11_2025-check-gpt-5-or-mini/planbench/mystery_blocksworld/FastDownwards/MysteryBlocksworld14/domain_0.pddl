(define (domain integrated)
  (:requirements :strips :typing)
  (:types entity)

  (:predicates
    (hand ?x - entity)
    (cats ?x - entity)
    (texture ?x - entity)
    (vase ?x - entity ?y - entity)
    (next ?x - entity ?y - entity)
    (sneeze ?x - entity)
    (stupendous ?x - entity)
    (collect ?x - entity ?y - entity)
    (spring ?x - entity)
  )

  (:action paltry
    :parameters (?object_0 - entity ?object_1 - entity ?object_2 - entity)
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
    :parameters (?object_0 - entity ?object_1 - entity ?object_2 - entity)
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
    :parameters (?object_0 - entity ?object_1 - entity ?object_2 - entity)
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
    :parameters (?object_0 - entity ?object_1 - entity ?object_2 - entity ?object_3 - entity)
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
    :parameters (?object_0 - entity ?object_1 - entity ?object_2 - entity)
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
    :parameters (?object_0 - entity ?object_1 - entity ?object_2 - entity)
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