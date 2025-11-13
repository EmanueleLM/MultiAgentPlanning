(define (domain depots26-domain)
  (:requirements :strips :typing)
  (:types obj)

  (:predicates
    (cats ?x - obj)
    (hand ?x - obj)
    (sneeze ?x - obj)
    (spring ?x - obj)
    (stupendous ?x - obj)
    (texture ?x - obj)
    (collect ?x - obj ?y - obj)
    (next ?x - obj ?y - obj)
    (vase ?x - obj ?y - obj)
  )

  (:action paltry
    :parameters (?a - obj ?b - obj ?c - obj)
    :precondition (and
      (hand ?a)
      (cats ?b)
      (texture ?c)
      (vase ?a ?b)
      (next ?b ?c)
    )
    :effect (and
      (next ?a ?c)
      (not (vase ?a ?b))
    )
  )

  (:action sip
    :parameters (?a - obj ?b - obj ?c - obj)
    :precondition (and
      (hand ?a)
      (cats ?b)
      (texture ?c)
      (next ?a ?c)
      (next ?b ?c)
    )
    :effect (and
      (vase ?a ?b)
      (not (next ?a ?c))
    )
  )

  (:action clip
    :parameters (?a - obj ?b - obj ?c - obj)
    :precondition (and
      (hand ?a)
      (sneeze ?b)
      (texture ?c)
      (next ?b ?c)
      (next ?a ?c)
    )
    :effect (and
      (vase ?a ?b)
      (not (next ?a ?c))
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
      (next ?a ?c)
      (not (next ?a ?b))
    )
  )

  (:action memory
    :parameters (?a - obj ?b - obj ?c - obj)
    :precondition (and
      (cats ?a)
      (spring ?b)
      (spring ?c)
      (next ?a ?b)
    )
    :effect (and
      (next ?a ?c)
      (not (next ?a ?b))
    )
  )

  (:action tightfisted
    :parameters (?a - obj ?b - obj ?c - obj)
    :precondition (and
      (hand ?a)
      (sneeze ?b)
      (texture ?c)
      (next ?b ?c)
      (vase ?a ?b)
    )
    :effect (and
      (next ?a ?c)
      (not (vase ?a ?b))
    )
  )
)