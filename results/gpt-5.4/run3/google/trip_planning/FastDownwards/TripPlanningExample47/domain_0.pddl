(define (domain europe_trip_7_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city day
  )

  (:predicates
    (at ?c - city ?d - day)
    (direct ?from - city ?to - city)
    (next_day ?d1 - day ?d2 - day)
    (visited ?c - city)
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?c ?d1)
      (next_day ?d1 ?d2)
      (not (at paris ?d2))
      (not (at istanbul ?d2))
      (not (at salzburg ?d2))
    )
    :effect (and
      (at ?c ?d2)
      (visited ?c)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?from ?d1)
      (next_day ?d1 ?d2)
      (direct ?from ?to)
      (not (at ?from ?d2))
      (not (at ?to ?d2))
      (not (at paris ?d2))
      (not (at istanbul ?d2))
      (not (at salzburg ?d2))
    )
    :effect (and
      (at ?to ?d2)
      (visited ?to)
    )
  )
)