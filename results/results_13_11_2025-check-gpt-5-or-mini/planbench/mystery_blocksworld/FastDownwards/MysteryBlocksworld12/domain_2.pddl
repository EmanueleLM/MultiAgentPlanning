(define (domain DomainMysteryBlocksworld12)
  (:requirements :strips :typing :negative-preconditions)
  (:types entity)
  (:predicates
    (hand ?x - entity)
    (cats ?x - entity)
    (sneeze ?x - entity)
    (texture ?x - entity)
    (spring ?x - entity)
    (stupendous ?x - entity)
    (collect ?x - entity ?y - entity)
    (vase ?x - entity ?y - entity)
    (next ?x - entity ?y - entity)
  )

  (:action paltry
    :parameters (?a - entity ?b - entity ?c - entity)
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
    :parameters (?a - entity ?b - entity ?c - entity)
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
    :parameters (?a - entity ?b - entity ?c - entity)
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
    :parameters (?a - entity ?b - entity ?c - entity ?d - entity)
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
    :parameters (?a - entity ?b - entity ?c - entity)
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
    :parameters (?a - entity ?b - entity ?c - entity)
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