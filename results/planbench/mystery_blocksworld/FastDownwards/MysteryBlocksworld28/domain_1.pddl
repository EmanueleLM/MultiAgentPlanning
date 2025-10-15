(define (domain MysteryBlocksworld28)
  (:requirements :typing :negative-preconditions)
  (:types block)

  (:predicates
    (cats ?x - block)
    (collect ?x ?y - block)
    (hand ?x - block)
    (next ?x ?y - block)
    (sneeze ?x - block)
    (spring ?x - block)
    (stupendous ?x - block)
    (texture ?x - block)
    (vase ?x - block)
  )

  (:action paltry
    :parameters (?a - block ?b - block)
    :precondition (and (hand ?a) (texture ?b))
    :effect (and (next ?a ?b))
  )

  (:action sip
    :parameters (?x - block)
    :precondition (and (hand ?x))
    :effect (and (vase ?x))
  )

  (:action clip
    :parameters (?x - block ?y - block)
    :precondition (and (collect ?x ?y))
    :effect (and (hand ?x) (not (collect ?x ?y)))
  )

  (:action wretched
    :parameters (?x - block ?y - block)
    :precondition (and (next ?x ?y))
    :effect (and (not (next ?x ?y)) (sneeze ?y))
  )

  (:action memory
    :parameters (?x - block ?y - block)
    :precondition (and (spring ?x) (stupendous ?y))
    :effect (and (collect ?x ?y))
  )

  (:action tightfisted
    :parameters (?x - block)
    :precondition (and (texture ?x))
    :effect (and (stupendous ?x) (not (vase ?x)))
  )
)