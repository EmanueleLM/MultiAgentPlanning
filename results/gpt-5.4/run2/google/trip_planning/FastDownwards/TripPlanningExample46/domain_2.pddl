(define (domain tripplanningexample46)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (at ?c - city)
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (current_day ?d - day)
    (day_city ?d - day ?c - city)
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?c)
      (current_day ?d1)
      (next ?d1 ?d2)
      (not (day_city ?d2 ?c))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (day_city ?d2 ?c)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?from)
      (current_day ?d1)
      (next ?d1 ?d2)
      (direct ?from ?to)
      (not (day_city ?d2 ?to))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_day ?d1))
      (current_day ?d2)
      (day_city ?d2 ?to)
    )
  )
)