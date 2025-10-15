(define (domain integrated-domain)
  (:requirements :typing :negative-preconditions)
  (:types object)

  (:predicates
    (hand ?o - object)
    (cats ?o - object)
    (sneeze ?o - object)
    (texture ?o - object)
    (vase ?o - object)
    (next ?a - object ?b - object)
    (collect ?a - object ?b - object)
    (spring ?o - object)
    (stupendous ?o - object)
  )

  (:action memory
    :parameters (?x - object ?from - object ?to - object)
    :precondition (next ?x ?from)
    :effect (and
      (next ?x ?to)
      (not (next ?x ?from))
    )
  )

  (:action sip
    :parameters (?actor - object ?source - object ?to - object ?old - object)
    :precondition (and
      (hand ?actor)
      (next ?source ?to)
      (next ?actor ?old)
    )
    :effect (and
      (next ?actor ?to)
      (not (next ?actor ?old))
    )
  )

  (:action paltry
    :parameters (?actor - object ?source - object ?to - object ?old - object)
    :precondition (and
      (hand ?actor)
      (next ?source ?to)
      (next ?actor ?old)
    )
    :effect (and
      (next ?actor ?to)
      (not (next ?actor ?old))
    )
  )

  (:action clip
    :parameters (?a - object ?b - object)
    :precondition (and)
    :effect (and)
  )

  (:action wretched
    :parameters (?a - object)
    :precondition (and)
    :effect (and)
  )

  (:action tightfisted
    :parameters (?a - object ?b - object)
    :precondition (and)
    :effect (and)
  )
)