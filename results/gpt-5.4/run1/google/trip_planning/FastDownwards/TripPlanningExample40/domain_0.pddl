(define (domain european_trip_8_days)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
    visit_token
  )

  (:predicates
    (at ?c - city ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (direct ?from - city ?to - city)
    (advanced_from ?d - day)
    (token_for_city ?t - visit_token ?c - city)
    (token_used ?t - visit_token)
  )

  (:action stay_and_advance
    :parameters (?c - city ?d1 - day ?d2 - day ?t - visit_token)
    :precondition (and
      (at ?c ?d1)
      (next_day ?d1 ?d2)
      (not (advanced_from ?d1))
      (token_for_city ?t ?c)
      (not (token_used ?t))
    )
    :effect (and
      (at ?c ?d2)
      (advanced_from ?d1)
      (token_used ?t)
    )
  )

  (:action fly_and_advance
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day ?t - visit_token)
    :precondition (and
      (at ?from ?d1)
      (next_day ?d1 ?d2)
      (not (advanced_from ?d1))
      (direct ?from ?to)
      (token_for_city ?t ?to)
      (not (token_used ?t))
    )
    :effect (and
      (at ?to ?d2)
      (advanced_from ?d1)
      (token_used ?t)
    )
  )
)