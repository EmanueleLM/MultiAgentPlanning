(define (domain european_trip_12_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (at ?c - city)
    (direct_flight ?from - city ?to - city)
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (last_day ?d - day)
    (visited_on ?d - day ?c - city)
  )

  (:action fly
    :parameters (?from - city ?to - city)
    :precondition (and
      (at ?from)
      (direct_flight ?from ?to)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
    )
  )

  (:action spend_day_progress
    :parameters (?d - day ?d_next - day ?c - city)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at ?c)
      (not (visited_on ?d ?c))
    )
    :effect (and
      (visited_on ?d ?c)
      (not (current_day ?d))
      (current_day ?d_next)
    )
  )

  (:action spend_day_last
    :parameters (?d - day ?c - city)
    :precondition (and
      (current_day ?d)
      (last_day ?d)
      (at ?c)
      (not (visited_on ?d ?c))
    )
    :effect (and
      (visited_on ?d ?c)
      (not (current_day ?d))
    )
  )
)