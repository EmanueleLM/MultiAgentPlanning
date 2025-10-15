(define (domain integrated-domain)
  (:requirements :typing :strips :negative-preconditions)
  (:types object)

  (:predicates
    (hand ?o - object)
    (cats ?o - object)
    (sneeze ?o - object)
    (texture ?o - object)
    (vase ?a - object ?b - object)
    (next ?a - object ?b - object)
    (collect ?a - object ?b - object)
    (spring ?o - object)
    (stupendous ?o - object)
  )

  (:action paltry
    :parameters (?actor - object ?b - object ?c - object)
    :precondition (and
      (hand ?actor)
      (cats ?b)
      (texture ?c)
      (vase ?actor ?b)
      (next ?b ?c)
    )
    :effect (and
      (next ?actor ?c)
      (not (vase ?actor ?b))
    )
  )

  (:action sip
    :parameters (?actor - object ?b - object ?c - object)
    :precondition (and
      (hand ?actor)
      (cats ?b)
      (texture ?c)
      (next ?actor ?c)
      (next ?b ?c)
    )
    :effect (and
      (vase ?actor ?b)
      (not (next ?actor ?c))
    )
  )

  (:action clip
    :parameters (?actor - object ?b - object ?c - object)
    :precondition (and
      (hand ?actor)
      (sneeze ?b)
      (texture ?c)
      (next ?b ?c)
      (next ?actor ?c)
    )
    :effect (and
      (vase ?actor ?b)
      (not (next ?actor ?c))
    )
  )

  (:action wretched
    :parameters (?a - object ?b - object ?c - object ?d - object)
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
    :parameters (?x - object ?from - object ?to - object)
    :precondition (and
      (cats ?x)
      (spring ?from)
      (spring ?to)
      (next ?x ?from)
    )
    :effect (and
      (next ?x ?to)
      (not (next ?x ?from))
    )
  )

  (:action tightfisted
    :parameters (?actor - object ?b - object ?c - object)
    :precondition (and
      (hand ?actor)
      (sneeze ?b)
      (texture ?c)
      (next ?b ?c)
      (vase ?actor ?b)
    )
    :effect (and
      (next ?actor ?c)
      (not (vase ?actor ?b))
    )
  )
)