(define (domain european_trip_13_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city day
  )

  (:predicates
    (direct ?from - city ?to - city)
    (next_day ?d1 - day ?d2 - day)
    (current_day ?d - day)
    (at ?c - city)
    (spent ?d - day ?c - city)
    (assigned ?d - day)
  )

  (:action stay_to_next_day
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at ?c)
      (assigned ?d1)
      (not (assigned ?d2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (assigned ?d2)
      (spent ?d2 ?c)
    )
  )

  (:action fly_to_next_day
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at ?from)
      (direct ?from ?to)
      (assigned ?d1)
      (not (assigned ?d2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at ?from))
      (at ?to)
      (assigned ?d2)
      (spent ?d2 ?to)
    )
  )
)