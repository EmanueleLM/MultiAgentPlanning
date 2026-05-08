(define (domain europe_trip_14days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (at ?c - city)
    (flight ?from - city ?to - city)
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (show_day ?d - day)
    (visited ?c - city)
  )

  (:action stay
    :parameters (?c - city ?d - day ?d_next - day)
    :precondition (and
      (at ?c)
      (current_day ?d)
      (next_day ?d ?d_next)
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (visited ?c)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d - day ?d_next - day)
    :precondition (and
      (at ?from)
      (not (at ?to))
      (flight ?from ?to)
      (current_day ?d)
      (next_day ?d ?d_next)
      (not (show_day ?d))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_day ?d))
      (current_day ?d_next)
      (visited ?to)
    )
  )
)