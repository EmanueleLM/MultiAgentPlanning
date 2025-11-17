(define (domain eu-trip)
  (:requirements :strips :typing :negative-preconditions)
  (:types day city)
  (:predicates
    (next ?d1 - day ?d2 - day)
    (at ?d - day ?c - city)
    (adjacent ?c1 - city ?c2 - city)
    (filled ?d - day)
    (target ?d - day ?c - city)
  )

  (:action stay
    :parameters (?d1 - day ?d2 - day ?c - city)
    :precondition (and
      (next ?d1 ?d2)
      (filled ?d1)
      (at ?d1 ?c)
      (target ?d2 ?c)
      (not (filled ?d2))
    )
    :effect (and
      (at ?d2 ?c)
      (filled ?d2)
    )
  )

  (:action fly
    :parameters (?d1 - day ?d2 - day ?from - city ?to - city)
    :precondition (and
      (next ?d1 ?d2)
      (filled ?d1)
      (at ?d1 ?from)
      (adjacent ?from ?to)
      (target ?d2 ?to)
      (not (filled ?d2))
    )
    :effect (and
      (at ?d2 ?to)
      (filled ?d2)
    )
  )
)