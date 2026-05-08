(define (domain european_trip_11_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city day
  )

  (:predicates
    (direct_flight ?from - city ?to - city)
    (next_day ?d1 - day ?d2 - day)
    (current_day ?d - day)
    (at ?d - day ?c - city)
    (assigned ?d - day)
  )

  (:action assign_first_day
    :parameters (?c - city)
    :precondition (and
      (current_day day_1)
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
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (at ?d1 ?c)
      (not (assigned ?d2))
    )
    :effect (and
      (at ?d2 ?c)
      (assigned ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action fly_to_next_day
    :parameters (?d1 - day ?d2 - day ?from - city ?to - city)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (assigned ?d1)
      (at ?d1 ?from)
      (direct_flight ?from ?to)
      (not (assigned ?d2))
    )
    :effect (and
      (at ?d2 ?to)
      (assigned ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )
)