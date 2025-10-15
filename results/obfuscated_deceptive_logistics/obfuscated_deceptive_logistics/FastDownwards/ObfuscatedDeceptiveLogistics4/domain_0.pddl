(define (domain integrated-domain)
  (:requirements :strips :typing :negative-preconditions)
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

  ; memory: change an object's next from one target to another
  (:action memory
    :parameters (?x - object ?from - object ?to - object)
    :precondition (next ?x ?from)
    :effect (and
      (next ?x ?to)
      (not (next ?x ?from))
    )
  )

  ; sip: copy the next relation from ?source to ?actor; remove actor's previous next (?old)
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

  ; paltry: similar to sip (another primitive that copies next from source to actor, removing previous)
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

  ; clip, wretched, tightfisted: declared actions with no effects (inert) because the agents listed them
  ; but did not provide usable semantics. Kept to reflect available action names only.
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