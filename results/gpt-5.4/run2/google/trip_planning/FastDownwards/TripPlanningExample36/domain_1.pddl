(define (domain european_trip_13_days)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (current_day ?d - day)
    (at ?c - city)
    (visited ?c - city ?d - day)
  )

  (:action stay
    :parameters (?d1 - day ?d2 - day ?c - city)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at ?c)
      (not (visited ?c ?d2))
    )
    :effect (and
      (visited ?c ?d2)
      (current_day ?d2)
      (not (current_day ?d1))
    )
  )

  (:action fly
    :parameters (?d1 - day ?d2 - day ?from - city ?to - city)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at ?from)
      (direct ?from ?to)
      (not (visited ?to ?d2))
      (not (= ?from ?to))
    )
    :effect (and
      (visited ?to ?d2)
      (at ?to)
      (current_day ?d2)
      (not (at ?from))
      (not (current_day ?d1))
    )
  )
)