(define (domain european_trip_15_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city day
  )

  (:predicates
    (direct ?from - city ?to - city)
    (next_day ?d1 - day ?d2 - day)
    (at ?c - city ?d - day)
    (assigned ?d - day)
    (current_day ?d - day)
  )

  (:action assign_start_city
    :parameters (?c - city)
    :precondition (and
      (current_day day_1)
      (not (assigned day_1))
    )
    :effect (and
      (at ?c day_1)
      (assigned day_1)
    )
  )

  (:action stay_to_next_day
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at ?c ?d1)
      (assigned ?d1)
      (not (assigned ?d2))
    )
    :effect (and
      (at ?c ?d2)
      (assigned ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action fly_to_next_day
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at ?from ?d1)
      (assigned ?d1)
      (direct ?from ?to)
      (not (assigned ?d2))
    )
    :effect (and
      (at ?to ?d2)
      (assigned ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )
)