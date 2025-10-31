(define (domain mystery-blocksworld)
  (:requirements :typing :negative-preconditions)
  (:types object)
  (:predicates
    (hand ?x - object)
    (cats ?x - object)
    (texture ?x - object)
    (vase ?x - object)
    (next ?x ?y - object)
    (sneeze ?x - object)
    (stupendous ?x - object)
    (collect ?x - object)
    (spring ?x - object)
  )

  (:action paltry
    :parameters (?x - object ?y - object)
    :precondition (and (cats ?x) (not (vase ?y)))
    :effect (and (collect ?x) (not (cats ?x)) (vase ?y))
  )

  (:action sip
    :parameters (?x - object)
    :precondition (and (hand ?x))
    :effect (and (sneeze ?x) (not (hand ?x)))
  )

  (:action clip
    :parameters (?x - object ?y - object)
    :precondition (and (next ?x ?y))
    :effect (and (texture ?x) (not (next ?x ?y)))
  )

  (:action wretched
    :parameters (?x - object ?y - object ?z - object)
    :precondition (and (stupendous ?x) (collect ?y) (spring ?z))
    :effect (and (not (spring ?z)) (vase ?x))
  )

  (:action memory
    :parameters (?x - object ?y - object)
    :precondition (and (not (texture ?y)))
    :effect (and (texture ?y) (stupendous ?x))
  )

  (:action tightfisted
    :parameters (?x - object)
    :precondition (and (not (collect ?x)))
    :effect (and (collect ?x))
  )
)