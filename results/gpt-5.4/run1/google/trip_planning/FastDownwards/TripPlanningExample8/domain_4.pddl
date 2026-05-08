(define (domain tripplanningexample8)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (at ?c - city)
    (direct ?from - city ?to - city)
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (visited_day_in ?d - day ?c - city)
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?c)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (not (visited_day_in ?d1 ?c))
    )
    :effect (and
      (visited_day_in ?d1 ?c)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?from)
      (not (at ?to))
      (direct ?from ?to)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (not (visited_day_in ?d1 ?to))
    )
    :effect (and
      (visited_day_in ?d1 ?to)
      (not (at ?from))
      (at ?to)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )
)