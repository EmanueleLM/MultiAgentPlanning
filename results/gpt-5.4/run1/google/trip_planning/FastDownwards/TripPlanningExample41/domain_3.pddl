(define (domain tripplanningexample41_domain)
  (:requirements :strips :typing :negative-preconditions)

  (:types city day)

  (:predicates
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (at ?c - city)
    (visited ?d - day ?c - city)
    (current_day ?d - day)
  )

  (:action stay
    :parameters (?d1 - day ?d2 - day ?c - city)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at ?c)
      (not (visited ?d2 ?c))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (visited ?d2 ?c)
    )
  )

  (:action fly
    :parameters (?d1 - day ?d2 - day ?from - city ?to - city)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at ?from)
      (direct ?from ?to)
      (not (at ?to))
      (not (visited ?d2 ?to))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at ?from))
      (at ?to)
      (visited ?d2 ?to)
    )
  )
)