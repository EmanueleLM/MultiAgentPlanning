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

  (:action paltry
    :parameters (?x - obj ?y - obj ?z - obj)
    :precondition (and
      (hand ?x)
      (cats ?y)
      (texture ?z)
      (vase ?x ?y)
      (next ?y ?z)
    )
    :effect (and
      (not (vase ?x ?y))
      (next ?x ?z)
    )
  )

  (:action sip
    :parameters (?x - obj ?y - obj ?z - obj)
    :precondition (and
      (hand ?x)
      (cats ?y)
      (texture ?z)
      (next ?x ?z)
      (next ?y ?z)
    )
    :effect (and
      (not (next ?x ?z))
      (vase ?x ?y)
    )
  )

  (:action clip
    :parameters (?x - obj ?y - obj ?z - obj)
    :precondition (and
      (hand ?x)
      (sneeze ?y)
      (texture ?z)
      (next ?y ?z)
      (next ?x ?z)
    )
    :effect (and
      (not (next ?x ?z))
      (vase ?x ?y)
    )
  )

  (:action wretched
    :parameters (?a - obj ?b - obj ?c - obj ?d - obj)
    :precondition (and
      (sneeze ?a)
      (texture ?b)
      (texture ?c)
      (stupendous ?d)
      (next ?a ?b)
      (collect ?b ?d)
      (collect ?c ?d)
    )
    :effect (and
      (not (next ?a ?b))
      (next ?a ?c)
    )
  )

  (:action memory
    :parameters (?x - obj ?y - obj ?z - obj)
    :precondition (and
      (cats ?x)
      (spring ?y)
      (spring ?z)
      (next ?x ?y)
    )
    :effect (and
      (not (next ?x ?y))
      (next ?x ?z)
    )
  )

  (:action tightfisted
    :parameters (?x - obj ?y - obj ?z - obj)
    :precondition (and
      (hand ?x)
      (sneeze ?y)
      (texture ?z)
      (next ?y ?z)
      (vase ?x ?y)
    )
    :effect (and
      (not (vase ?x ?y))
      (next ?x ?z)
    )
  )
)