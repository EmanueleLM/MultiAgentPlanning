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
    (at ?c - city ?d - day)
    (visited ?c - city ?d - day)
    (conference_day ?d - day)
  )

  (:action start_in_city
    :parameters (?c - city)
    :precondition
      (and
        (current_day day1)
        (not (at geneva day1))
        (not (at madrid day1))
        (not (at venice day1))
      )
    :effect
      (and
        (at ?c day1)
        (visited ?c day1)
      )
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition
      (and
        (current_day ?d1)
        (next_day ?d1 ?d2)
        (at ?c ?d1)
        (not (at geneva ?d2))
        (not (at madrid ?d2))
        (not (at venice ?d2))
      )
    :effect
      (and
        (at ?c ?d2)
        (visited ?c ?d2)
        (not (current_day ?d1))
        (current_day ?d2)
      )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition
      (and
        (current_day ?d1)
        (next_day ?d1 ?d2)
        (at ?from ?d1)
        (direct_flight ?from ?to)
        (not (at geneva ?d2))
        (not (at madrid ?d2))
        (not (at venice ?d2))
      )
    :effect
      (and
        (at ?to ?d2)
        (visited ?to ?d2)
        (not (current_day ?d1))
        (current_day ?d2)
      )
  )
)