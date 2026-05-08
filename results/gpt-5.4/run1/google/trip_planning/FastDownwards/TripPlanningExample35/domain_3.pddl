(define (domain european_trip_10_day_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (current ?d - day)
    (at ?c - city)
    (occupied ?d - day ?c - city)
  )

  (:action stay
    :parameters (?d1 - day ?d2 - day ?c - city)
    :precondition (and
      (current ?d1)
      (next ?d1 ?d2)
      (at ?c)
      (not (occupied ?d2 ?c))
    )
    :effect (and
      (not (current ?d1))
      (current ?d2)
      (occupied ?d2 ?c)
    )
  )

  (:action fly
    :parameters (?d1 - day ?d2 - day ?from - city ?to - city)
    :precondition (and
      (current ?d1)
      (next ?d1 ?d2)
      (at ?from)
      (direct ?from ?to)
      (not (occupied ?d2 ?to))
    )
    :effect (and
      (not (current ?d1))
      (current ?d2)
      (not (at ?from))
      (at ?to)
      (occupied ?d2 ?to)
    )
  )
)