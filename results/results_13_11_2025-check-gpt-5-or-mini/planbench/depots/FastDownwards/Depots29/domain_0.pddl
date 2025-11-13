(define (domain depots29)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj)
  (:predicates
    (hand ?x - obj)
    (cats ?x - obj)
    (sneeze ?x - obj)
    (spring ?x - obj)
    (stupendous ?x - obj)
    (texture ?x - obj)
    (collect ?x - obj ?y - obj)
    (next ?x - obj ?y - obj)
    (vase ?x - obj ?y - obj)
  )

  (:action move_to_texture
    :parameters (?a - obj ?from - obj ?to - obj)
    :precondition (and
      (hand ?a)
      (next ?a ?from)
      (texture ?to)
    )
    :effect (and
      (not (next ?a ?from))
      (next ?a ?to)
    )
  )

  (:action move_from_spring
    :parameters (?a - obj ?from - obj ?to - obj)
    :precondition (and
      (hand ?a)
      (next ?a ?from)
      (spring ?from)
    )
    :effect (and
      (not (next ?a ?from))
      (next ?a ?to)
    )
  )

  (:action move_to_collected
    :parameters (?a - obj ?from - obj ?to - obj ?y - obj)
    :precondition (and
      (hand ?a)
      (next ?a ?from)
      (collect ?to ?y)
    )
    :effect (and
      (not (next ?a ?from))
      (next ?a ?to)
    )
  )

  (:action sneeze_rewire
    :parameters (?a - obj ?from - obj ?to - obj)
    :precondition (and
      (sneeze ?a)
      (next ?a ?from)
    )
    :effect (and
      (not (next ?a ?from))
      (next ?a ?to)
    )
  )

  (:action cats_link_shift
    :parameters (?a - obj ?from - obj ?to - obj)
    :precondition (and
      (cats ?from)
      (next ?a ?from)
    )
    :effect (and
      (not (next ?a ?from))
      (next ?a ?to)
    )
  )

  (:action vase_reassign
    :parameters (?a - obj ?from - obj ?to - obj ?y - obj)
    :precondition (and
      (hand ?a)
      (next ?a ?from)
      (vase ?to ?y)
    )
    :effect (and
      (not (next ?a ?from))
      (next ?a ?to)
    )
  )
)