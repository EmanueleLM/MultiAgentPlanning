(define (domain european_trip_days)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city day
  )

  (:predicates
    (next ?d1 - day ?d2 - day)
    (direct ?from - city ?to - city)
    (current_day ?d - day)
    (at ?c - city)
    (visited_day ?d - day ?c - city)
  )

  (:action stay_to_next_day
    :parameters (?d1 - day ?d2 - day ?c - city)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at ?c)
    )
    :effect (and
      (visited_day ?d2 ?c)
      (current_day ?d2)
      (not (current_day ?d1))
    )
  )

  (:action fly_to_next_day
    :parameters (?d1 - day ?d2 - day ?from - city ?to - city)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at ?from)
      (direct ?from ?to)
      (not (at ?to))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (visited_day ?d2 ?to)
      (current_day ?d2)
      (not (current_day ?d1))
    )
  )
)