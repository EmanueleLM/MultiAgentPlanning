(define (domain MysteryBlocksworld12)
  (:requirements :strips :typing :negative-preconditions)
  (:types entity)
  (:predicates
    (hand ?x - entity)
    (cats ?x - entity)
    (texture ?x - entity)
    (vase ?x - entity ?y - entity)
    (next ?x - entity ?y - entity)
    (sneeze ?x - entity)
    (spring ?x - entity)
    (stupendous ?x - entity)
    (collect ?x - entity ?y - entity)
  )

  (:action paltry
    :parameters (?x0 - entity ?x1 - entity ?x2 - entity)
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

  (:action sip
    :parameters (?x0 - entity ?x1 - entity ?x2 - entity)
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

  (:action clip
    :parameters (?x0 - entity ?x1 - entity ?x2 - entity)
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

  (:action wretched
    :parameters (?x0 - entity ?x1 - entity ?x2 - entity ?x3 - entity)
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

  (:action memory
    :parameters (?x0 - entity ?x1 - entity ?x2 - entity)
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

  (:action tightfisted
    :parameters (?x0 - entity ?x1 - entity ?x2 - entity)
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