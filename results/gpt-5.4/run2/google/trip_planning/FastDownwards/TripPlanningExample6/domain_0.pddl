(define (domain european_trip_8_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (at ?c - city)
    (direct ?from - city ?to - city)
    (next_day ?d1 - day ?d2 - day)
    (current_day ?d - day)
    (spent ?d - day ?c - city)
    (day_closed ?d - day)
  )

  (:action stay_and_advance
    :parameters (?d - day ?dnext - day ?c - city)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dnext)
      (at ?c)
      (not (day_closed ?d))
    )
    :effect (and
      (spent ?d ?c)
      (day_closed ?d)
      (not (current_day ?d))
      (current_day ?dnext)
    )
  )

  (:action fly_and_advance
    :parameters (?d - day ?dnext - day ?from - city ?to - city)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dnext)
      (at ?from)
      (direct ?from ?to)
      (not (day_closed ?d))
    )
    :effect (and
      (spent ?d ?from)
      (day_closed ?d)
      (not (current_day ?d))
      (current_day ?dnext)
      (not (at ?from))
      (at ?to)
    )
  )

  (:action close_last_day
    :parameters (?d - day ?c - city)
    :precondition (and
      (current_day ?d)
      (at ?c)
      (not (day_closed ?d))
    )
    :effect (and
      (spent ?d ?c)
      (day_closed ?d)
    )
  )
)