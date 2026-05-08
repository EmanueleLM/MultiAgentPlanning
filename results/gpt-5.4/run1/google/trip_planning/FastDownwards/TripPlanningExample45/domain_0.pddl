(define (domain european_trip_16_days_instance)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (next_day ?d1 - day ?d2 - day)
    (current_day ?d - day)
    (at_on ?d - day ?c - city)
    (direct_flight ?from - city ?to - city)
  )

  (:action stay_to_next_day
    :parameters (?d1 - day ?d2 - day ?c - city)
    :precondition
      (and
        (current_day ?d1)
        (next_day ?d1 ?d2)
        (at_on ?d1 ?c)
        (not (at_on ?d2 copenhagen))
        (not (at_on ?d2 lisbon))
        (not (at_on ?d2 florence))
      )
    :effect
      (and
        (at_on ?d2 ?c)
        (not (current_day ?d1))
        (current_day ?d2)
      )
  )

  (:action fly_to_next_day
    :parameters (?d1 - day ?d2 - day ?from - city ?to - city)
    :precondition
      (and
        (current_day ?d1)
        (next_day ?d1 ?d2)
        (at_on ?d1 ?from)
        (direct_flight ?from ?to)
        (not (at_on ?d2 copenhagen))
        (not (at_on ?d2 lisbon))
        (not (at_on ?d2 florence))
      )
    :effect
      (and
        (at_on ?d2 ?to)
        (not (current_day ?d1))
        (current_day ?d2)
      )
  )
)