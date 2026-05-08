(define (domain european_trip_13_days_instance)
  (:requirements :strips :typing)

  (:types
    city
    day
  )

  (:predicates
    (in ?c - city ?d - day)
    (next ?d1 - day ?d2 - day)
    (direct ?from - city ?to - city)
    (early ?d - day)
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (in ?c ?d1)
      (next ?d1 ?d2))
    :effect (in ?c ?d2)
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (in ?from ?d1)
      (next ?d1 ?d2)
      (direct ?from ?to))
    :effect (in ?to ?d2)
  )
)