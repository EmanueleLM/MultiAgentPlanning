(define (domain european_trip_11_days)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city day
  )

  (:predicates
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (at ?c - city)
    (direct_flight ?from - city ?to - city)
    (visited_on ?c - city ?d - day)
    (last_day ?d - day)
  )

  (:action stay_and_advance
    :parameters (?c - city ?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (at ?c)
      (next_day ?d ?d_next)
      (not (last_day ?d))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (visited_on ?c ?d_next)
    )
  )

  (:action fly_and_advance
    :parameters (?from - city ?to - city ?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (at ?from)
      (direct_flight ?from ?to)
      (next_day ?d ?d_next)
      (not (last_day ?d))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_day ?d))
      (current_day ?d_next)
      (visited_on ?to ?d_next)
    )
  )
)