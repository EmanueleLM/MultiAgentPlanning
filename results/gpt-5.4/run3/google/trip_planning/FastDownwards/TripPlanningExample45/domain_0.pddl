(define (domain european_trip_days)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city day
  )

  (:predicates
    (next ?d1 - day ?d2 - day)
    (direct ?from - city ?to - city)
    (at ?d - day ?c - city)
    (assigned ?d - day)
    (current_day ?d - day)
  )

  (:action stay_to_next_day
    :parameters (?d1 - day ?d2 - day ?c - city)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (assigned ?d1)
      (at ?d1 ?c)
      (not (assigned ?d2))
    )
    :effect (and
      (at ?d2 ?c)
      (assigned ?d2)
      (current_day ?d2)
      (not (current_day ?d1))
    )
  )

  (:action fly_to_next_day
    :parameters (?d1 - day ?d2 - day ?from - city ?to - city)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (assigned ?d1)
      (at ?d1 ?from)
      (direct ?from ?to)
      (not (assigned ?d2))
    )
    :effect (and
      (at ?d2 ?to)
      (assigned ?d2)
      (current_day ?d2)
      (not (current_day ?d1))
    )
  )
)