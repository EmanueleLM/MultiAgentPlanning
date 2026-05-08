(define (domain european_trip_12_days_instance)
  (:requirements :strips :typing)

  (:types
    city
    day
  )

  (:predicates
    (at ?c - city)
    (direct_flight ?from - city ?to - city)
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (spent_in ?d - day ?c - city)
  )

  (:action stay_one_day
    :parameters (?d1 - day ?d2 - day ?c - city)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at ?c)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (spent_in ?d1 ?c)
    )
  )

  (:action fly_and_spend_one_day
    :parameters (?d1 - day ?d2 - day ?from - city ?to - city)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at ?from)
      (direct_flight ?from ?to)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at ?from))
      (at ?to)
      (spent_in ?d1 ?to)
    )
  )
)