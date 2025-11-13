(define (domain tripplanningexample19)
  (:requirements :strips :typing :negative-preconditions)
  (:types day city)
  (:predicates
    (next ?d1 - day ?d2 - day)
    (first ?d - day)
    (assigned ?d - day)
    (at ?d - day ?c - city)
    (direct ?c1 - city ?c2 - city)
  )

  (:action assign-first
    :parameters (?d - day ?c - city)
    :precondition (and
      (first ?d)
      (not (assigned ?d))
    )
    :effect (and
      (assigned ?d)
      (at ?d ?c)
    )
  )

  (:action assign-next
    :parameters (?d1 - day ?d2 - day ?c1 - city ?c2 - city)
    :precondition (and
      (next ?d1 ?d2)
      (assigned ?d1)
      (at ?d1 ?c1)
      (not (assigned ?d2))
      (direct ?c1 ?c2)
    )
    :effect (and
      (assigned ?d2)
      (at ?d2 ?c2)
    )
  )
)