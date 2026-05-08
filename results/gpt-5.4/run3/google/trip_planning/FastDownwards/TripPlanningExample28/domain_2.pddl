(define (domain european_trip_12_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (at ?c - city)
    (direct_flight ?from - city ?to - city)
    (next_day ?d1 - day ?d2 - day)
    (current_day ?d - day)
    (spent_in ?d - day ?c - city)
    (day_used ?d - day)
  )

  (:action stay_one_day
    :parameters (?d1 - day ?d2 - day ?c - city)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at ?c)
      (not (day_used ?d1))
    )
    :effect (and
      (spent_in ?d1 ?c)
      (day_used ?d1)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action fly_on_day
    :parameters (?d1 - day ?d2 - day ?from - city ?to - city)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at ?from)
      (direct_flight ?from ?to)
      (not (day_used ?d1))
    )
    :effect (and
      (spent_in ?d1 ?to)
      (day_used ?d1)
      (not (at ?from))
      (at ?to)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )
)