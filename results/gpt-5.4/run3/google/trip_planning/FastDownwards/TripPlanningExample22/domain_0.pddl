(define (domain european_trip_11_days_instance)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (at ?c - city ?d - day)
    (direct_flight ?from - city ?to - city)
    (next_day ?d1 - day ?d2 - day)
    (current_day ?d - day)
  )

  (:action stay
    :parameters (?c - city ?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at ?c ?d)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (at ?c ?d_next)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d - day ?d_next - day)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d_next)
      (at ?from ?d)
      (direct_flight ?from ?to)
      (not (at ?to ?d))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (at ?to ?d_next)
    )
  )
)