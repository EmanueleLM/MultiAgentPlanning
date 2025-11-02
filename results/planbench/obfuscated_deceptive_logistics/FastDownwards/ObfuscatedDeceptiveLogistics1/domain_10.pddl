(define (domain obfuscated-deceptive-logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)
  (:predicates
    (cats ?x0 - obj)
    (hand ?x0 - obj)
    (sneeze ?x0 - obj)
    (spring ?x0 - obj)
    (stupendous ?x0 - obj)
    (texture ?x0 - obj)
    (next ?x0 - obj ?x1 - obj)
    (vase ?x0 - obj ?x1 - obj)
    (collect ?x0 - obj ?x1 - obj)
  )

  (:action paltry
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

  (:action sip
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

  (:action clip
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

  (:action wretched
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

  (:action memory
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

  (:action tightfisted
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