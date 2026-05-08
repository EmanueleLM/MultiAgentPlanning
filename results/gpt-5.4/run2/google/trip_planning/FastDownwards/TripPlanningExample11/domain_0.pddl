(define (domain european_trip_15_days_instance)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (direct ?from - city ?to - city)
    (next_day ?d1 - day ?d2 - day)
    (at ?d - day ?c - city)
    (assigned ?d - day)
    (start_day ?d - day)
  )

  (:action initialize_first_day
    :parameters (?c - city)
    :precondition (and
      (start_day day_1)
      (not (assigned day_1))
    )
    :effect (and
      (at day_1 ?c)
      (assigned day_1)
    )
  )

  (:action stay_to_next_day
    :parameters (?d1 - day ?d2 - day ?c - city)
    :precondition (and
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (at ?d1 ?c)
      (not (assigned ?d2))
    )
    :effect (and
      (at ?d2 ?c)
      (assigned ?d2)
    )
  )

  (:action fly_to_next_day
    :parameters (?d1 - day ?d2 - day ?from - city ?to - city)
    :precondition (and
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (at ?d1 ?from)
      (not (assigned ?d2))
      (direct ?from ?to)
      (not (at ?d1 ?to))
    )
    :effect (and
      (at ?d2 ?to)
      (assigned ?d2)
    )
  )
)