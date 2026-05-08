(define (domain european_trip_7_days)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (at ?c - city ?d - day)
    (used ?d - day)
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (next ?d1 ?d2)
      (at ?c ?d1)
      (used ?d1)
      (not (used ?d2))
    )
    :effect (and
      (used ?d2)
      (at ?c ?d2)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (next ?d1 ?d2)
      (at ?from ?d1)
      (used ?d1)
      (not (used ?d2))
      (direct ?from ?to)
      (not (at ?from ?d2))
    )
    :effect (and
      (used ?d2)
      (at ?to ?d2)
    )
  )
)