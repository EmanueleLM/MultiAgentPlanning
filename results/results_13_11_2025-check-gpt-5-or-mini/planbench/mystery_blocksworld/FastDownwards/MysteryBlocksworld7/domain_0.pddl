(define (domain mystery-objects)
  (:requirements :strips :typing :negative-preconditions)
  (:types object)
  (:predicates
    (hand ?o - object)
    (cats ?o - object)
    (sneeze ?o - object)
    (spring ?o - object)
    (stupendous ?o - object)
    (texture ?o - object)
    (next ?x - object ?y - object)
    (collect ?o - object)
    (vase ?o - object)
  )

  (:action paltry
    :parameters (?o - object)
    :precondition (and (cats ?o) (not (hand ?o)))
    :effect (and (hand ?o))
  )

  (:action sip
    :parameters (?o - object)
    :precondition (and (hand ?o) (not (sneeze ?o)))
    :effect (and (sneeze ?o))
  )

  (:action clip
    :parameters (?o - object)
    :precondition (and (sneeze ?o) (not (spring ?o)))
    :effect (and (spring ?o))
  )

  (:action wretched
    :parameters (?o - object)
    :precondition (and (spring ?o) (not (texture ?o)))
    :effect (and (texture ?o))
  )

  (:action memory
    :parameters (?o - object)
    :precondition (and (texture ?o) (not (stupendous ?o)))
    :effect (and (stupendous ?o))
  )

  (:action tightfisted
    :parameters (?x - object ?y - object)
    :precondition (and
      (stupendous ?x)
      (stupendous ?y)
      (collect ?x)
      (vase ?y)
      (not (next ?x ?y))
    )
    :effect (and
      (next ?x ?y)
      (not (collect ?x))
      (not (vase ?y))
    )
  )
)