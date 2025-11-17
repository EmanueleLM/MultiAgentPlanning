(define (domain six_actions_strips)
  (:requirements :strips :typing)
  (:types thing)
  (:predicates
    (cats ?x - thing)
    (hand ?x - thing)
    (sneeze ?x - thing)
    (spring ?x - thing)
    (texture ?x - thing)
    (stupendous ?x - thing)
    (next ?x - thing ?y - thing)
    (vase ?x - thing ?y - thing)
    (collect ?x - thing ?y - thing)
  )

  (:action paltry
    :parameters (?x - thing ?y - thing ?z - thing)
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
    :parameters (?x - thing ?y - thing ?z - thing)
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
    :parameters (?x - thing ?y - thing ?z - thing)
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
    :parameters (?w - thing ?x - thing ?y - thing ?z - thing)
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
    :parameters (?x - thing ?y - thing ?z - thing)
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
    :parameters (?x - thing ?y - thing ?z - thing)
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