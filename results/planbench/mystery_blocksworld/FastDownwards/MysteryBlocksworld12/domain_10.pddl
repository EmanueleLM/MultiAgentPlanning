(define (domain mysteryblocksworld12)
  (:requirements :strips :typing)
  (:types object)
  (:predicates
    (hand ?x - object)
    (cats ?x - object)
    (texture ?x - object)
    (vase ?x - object ?y - object)
    (next ?x - object ?y - object)
    (sneeze ?x - object)
    (stupendous ?x - object)
    (collect ?x - object ?y - object)
    (spring ?x - object)
  )

  (:action paltry
    :parameters (?x0 - object ?x1 - object ?x2 - object)
    :precondition (and
      (hand ?x0)
      (cats ?x1)
      (texture ?x2)
      (vase ?x0 ?x1)
      (next ?x1 ?x2))
    :effect (and
      (next ?x0 ?x2)
      (not (vase ?x0 ?x1)))
  )

  (:action sip
    :parameters (?x0 - object ?x1 - object ?x2 - object)
    :precondition (and
      (hand ?x0)
      (cats ?x1)
      (texture ?x2)
      (next ?x0 ?x2)
      (next ?x1 ?x2))
    :effect (and
      (vase ?x0 ?x1)
      (not (next ?x0 ?x2)))
  )

  (:action clip
    :parameters (?x0 - object ?x1 - object ?x2 - object)
    :precondition (and
      (hand ?x0)
      (sneeze ?x1)
      (texture ?x2)
      (next ?x1 ?x2)
      (next ?x0 ?x2))
    :effect (and
      (vase ?x0 ?x1)
      (not (next ?x0 ?x2)))
  )

  (:action wretched
    :parameters (?x0 - object ?x1 - object ?x2 - object ?x3 - object)
    :precondition (and
      (sneeze ?x0)
      (texture ?x1)
      (texture ?x2)
      (stupendous ?x3)
      (next ?x0 ?x1)
      (collect ?x1 ?x3)
      (collect ?x2 ?x3))
    :effect (and
      (next ?x0 ?x2)
      (not (next ?x0 ?x1)))
  )

  (:action memory
    :parameters (?x0 - object ?x1 - object ?x2 - object)
    :precondition (and
      (cats ?x0)
      (spring ?x1)
      (spring ?x2)
      (next ?x0 ?x1))
    :effect (and
      (next ?x0 ?x2)
      (not (next ?x0 ?x1)))
  )

  (:action tightfisted
    :parameters (?x0 - object ?x1 - object ?x2 - object)
    :precondition (and
      (hand ?x0)
      (sneeze ?x1)
      (texture ?x2)
      (next ?x1 ?x2)
      (vase ?x0 ?x1))
    :effect (and
      (next ?x0 ?x2)
      (not (vase ?x0 ?x1)))
  )
)