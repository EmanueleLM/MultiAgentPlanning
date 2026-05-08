(define (domain european_trip_11_days)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (at ?c - city)
    (direct_flight ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (today ?d - day)
    (counted ?c - city ?d - day)
  )

  (:action stay_day
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?c)
      (today ?d1)
      (next ?d1 ?d2)
      (not (counted ?c ?d1))
    )
    :effect (and
      (counted ?c ?d1)
      (not (today ?d1))
      (today ?d2)
    )
  )

  (:action fly_and_stay_day
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?from)
      (not (at ?to))
      (direct_flight ?from ?to)
      (today ?d1)
      (next ?d1 ?d2)
      (not (counted ?to ?d1))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (counted ?to ?d1)
      (not (today ?d1))
      (today ?d2)
    )
  )
)