(define (domain european_trip_16_days)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city day token
  )

  (:predicates
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (at ?c - city)
    (direct_flight ?from - city ?to - city)
    (occupied ?d - day ?c - city)
    (token_for_city ?t - token ?c - city)
    (unused ?t - token)
    (used ?t - token)
    (started)
  )

  (:action assign_first_day_in_city
    :parameters (?c - city ?t - token)
    :precondition (and
      (not (started))
      (token_for_city ?t ?c)
      (unused ?t)
    )
    :effect (and
      (started)
      (current_day day_1)
      (at ?c)
      (occupied day_1 ?c)
      (used ?t)
      (not (unused ?t))
    )
  )

  (:action stay_to_next_day
    :parameters (?d1 - day ?d2 - day ?c - city ?t - token)
    :precondition (and
      (started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at ?c)
      (token_for_city ?t ?c)
      (unused ?t)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (occupied ?d2 ?c)
      (used ?t)
      (not (unused ?t))
    )
  )

  (:action fly_to_next_day
    :parameters (?d1 - day ?d2 - day ?from - city ?to - city ?t - token)
    :precondition (and
      (started)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at ?from)
      (direct_flight ?from ?to)
      (not (at ?to))
      (token_for_city ?t ?to)
      (unused ?t)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at ?from))
      (at ?to)
      (occupied ?d2 ?to)
      (used ?t)
      (not (unused ?t))
    )
  )
)