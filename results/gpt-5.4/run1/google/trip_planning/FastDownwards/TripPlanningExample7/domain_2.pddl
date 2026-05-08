(define (domain european_trip_11_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (direct_flight ?from - city ?to - city)
    (next_day ?d1 - day ?d2 - day)
    (traveler_at ?c - city ?d - day)
    (day_used ?d - day)
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (traveler_at ?c ?d1)
      (next_day ?d1 ?d2)
      (day_used ?d1)
      (not (day_used ?d2))
    )
    :effect (and
      (traveler_at ?c ?d2)
      (day_used ?d2)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (traveler_at ?from ?d1)
      (next_day ?d1 ?d2)
      (day_used ?d1)
      (not (day_used ?d2))
      (direct_flight ?from ?to)
    )
    :effect (and
      (traveler_at ?to ?d2)
      (day_used ?d2)
    )
  )
)