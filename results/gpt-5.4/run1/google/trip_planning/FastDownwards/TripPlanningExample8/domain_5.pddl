(define (domain tripplanningexample8)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (at_city ?c - city)
    (direct ?from - city ?to - city)
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (day_in_city ?d - day ?c - city)
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (at_city ?c)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (not (day_in_city ?d1 ?c))
    )
    :effect (and
      (day_in_city ?d1 ?c)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (at_city ?from)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (direct ?from ?to)
      (not (day_in_city ?d1 ?to))
    )
    :effect (and
      (day_in_city ?d1 ?to)
      (not (at_city ?from))
      (at_city ?to)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )
)