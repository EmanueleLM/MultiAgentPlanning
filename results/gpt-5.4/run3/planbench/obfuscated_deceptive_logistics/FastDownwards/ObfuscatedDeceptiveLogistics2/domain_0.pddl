(define (domain jack_of_all_trades_instance)
  (:requirements :strips :typing)
  (:types thing)

  (:predicates
    (hand ?x - thing)
    (cats ?x - thing)
    (sneeze ?x - thing)
    (texture ?x - thing)
    (spring ?x - thing)
    (stupendous ?x - thing)
    (collect ?x - thing ?y - thing)
    (next ?x - thing ?y - thing)
    (vase ?x - thing ?y - thing)
  )

  (:action paltry
    :parameters (?x0 - thing ?x1 - thing ?x2 - thing)
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
    :parameters (?x0 - thing ?x1 - thing ?x2 - thing)
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
    :parameters (?x0 - thing ?x1 - thing ?x2 - thing)
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
    :parameters (?x0 - thing ?x1 - thing ?x2 - thing ?x3 - thing)
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
    :parameters (?x0 - thing ?x1 - thing ?x2 - thing)
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
    :parameters (?x0 - thing ?x1 - thing ?x2 - thing)
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