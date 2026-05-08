(define (domain european_trip_15_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (current_day ?d - day)
    (in_city ?c - city ?d - day)
    (visited_day ?d - day)
    (started)
  )

  (:action start_in_city
    :parameters (?c - city)
    :precondition (and
      (current_day d1)
      (not (started))
    )
    :effect (and
      (in_city ?c d1)
      (visited_day d1)
      (started)
    )
  )

  (:action stay_next_day
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (in_city ?c ?d1)
      (visited_day ?d1)
    )
    :effect (and
      (in_city ?c ?d2)
      (visited_day ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action fly_next_day
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (in_city ?from ?d1)
      (visited_day ?d1)
      (direct ?from ?to)
    )
    :effect (and
      (in_city ?to ?d2)
      (visited_day ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )
)