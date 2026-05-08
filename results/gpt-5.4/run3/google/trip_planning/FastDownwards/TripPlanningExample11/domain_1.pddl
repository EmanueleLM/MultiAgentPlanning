(define (domain european_trip_15_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (direct_flight ?from - city ?to - city)
    (next_day ?d1 - day ?d2 - day)
    (current_day ?d - day)
    (at ?c - city)
    (visited_on ?c - city ?d - day)
    (conference_day ?d - day ?c - city)
  )

  (:action stay
    :parameters (?c - city ?d - day ?dnext - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dnext)
      (at ?c)
    )
    :effect (and
      (visited_on ?c ?d)
      (not (current_day ?d))
      (current_day ?dnext)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d - day ?dnext - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dnext)
      (at ?from)
      (not (at ?to))
      (direct_flight ?from ?to)
    )
    :effect (and
      (visited_on ?from ?d)
      (not (at ?from))
      (at ?to)
      (not (current_day ?d))
      (current_day ?dnext)
    )
  )

  (:action stay_last
    :parameters (?c - city ?d - day)
    :precondition (and
      (current_day ?d)
      (at ?c)
    )
    :effect (and
      (visited_on ?c ?d)
      (not (current_day ?d))
    )
  )
)