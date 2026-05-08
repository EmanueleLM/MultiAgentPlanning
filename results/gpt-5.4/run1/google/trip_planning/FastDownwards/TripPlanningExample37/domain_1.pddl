(define (domain europe_trip_10_days_instance)
  (:requirements :strips :typing)

  (:types
    city day
  )

  (:predicates
    (at ?c - city)
    (direct ?from - city ?to - city)
    (next ?d - day ?d2 - day)
    (current ?d - day)
    (visited ?d - day ?c - city)
  )

  (:action stay
    :parameters (?d - day ?d2 - day ?c - city)
    :precondition (and
      (current ?d)
      (next ?d ?d2)
      (at ?c)
    )
    :effect (and
      (not (current ?d))
      (current ?d2)
      (visited ?d ?c)
    )
  )

  (:action fly
    :parameters (?d - day ?d2 - day ?from - city ?to - city)
    :precondition (and
      (current ?d)
      (next ?d ?d2)
      (at ?from)
      (direct ?from ?to)
    )
    :effect (and
      (not (current ?d))
      (current ?d2)
      (not (at ?from))
      (at ?to)
      (visited ?d ?to)
    )
  )
)