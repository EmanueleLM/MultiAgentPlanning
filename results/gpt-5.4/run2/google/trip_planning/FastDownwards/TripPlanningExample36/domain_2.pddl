(define (domain european_trip_13_days)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (at ?c - city)
    (current_day ?d - day)
    (day_in_city ?d - day ?c - city)
  )

  (:action stay
    :parameters (?d1 - day ?d2 - day ?c - city)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at ?c)
      (not (day_in_city ?d2 ?c))
    )
    :effect (and
      (day_in_city ?d2 ?c)
      (current_day ?d2)
      (not (current_day ?d1))
    )
  )

  (:action fly
    :parameters (?d1 - day ?d2 - day ?from - city ?to - city)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at ?from)
      (direct ?from ?to)
      (not (day_in_city ?d2 ?to))
      (not (= ?from ?to))
    )
    :effect (and
      (day_in_city ?d2 ?to)
      (at ?to)
      (current_day ?d2)
      (not (at ?from))
      (not (current_day ?d1))
    )
  )
)