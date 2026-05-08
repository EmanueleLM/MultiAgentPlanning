(define (domain european_trip_5_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (direct_flight ?from - city ?to - city)
    (next_day ?d1 - day ?d2 - day)
    (current_day ?d - day)
    (in_city ?c - city ?d - day)
    (day_assigned ?d - day)
  )

  (:action start_day1
    :parameters (?c - city)
    :precondition
      (and
        (current_day day1)
        (not (day_assigned day1))
      )
    :effect
      (and
        (in_city ?c day1)
        (day_assigned day1)
      )
  )

  (:action stay_to_next_day
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition
      (and
        (current_day ?d1)
        (next_day ?d1 ?d2)
        (in_city ?c ?d1)
        (not (day_assigned ?d2))
      )
    :effect
      (and
        (in_city ?c ?d2)
        (day_assigned ?d2)
        (not (current_day ?d1))
        (current_day ?d2)
      )
  )

  (:action fly_to_next_day
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition
      (and
        (current_day ?d1)
        (next_day ?d1 ?d2)
        (in_city ?from ?d1)
        (direct_flight ?from ?to)
        (not (day_assigned ?d2))
      )
    :effect
      (and
        (in_city ?to ?d2)
        (day_assigned ?d2)
        (not (current_day ?d1))
        (current_day ?d2)
      )
  )
)