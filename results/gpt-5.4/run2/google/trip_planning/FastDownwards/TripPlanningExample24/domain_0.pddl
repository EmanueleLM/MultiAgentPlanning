(define (domain european_trip_13_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
    count_token
  )

  (:predicates
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (last_day ?d - day)
    (at ?c - city)
    (direct_flight ?from - city ?to - city)
    (unused ?t - count_token)
    (token_for_city ?t - count_token ?c - city)
    (stayed_on ?c - city ?d - day)
    (workshop_day ?d - day)
    (workshop_attended)
    (trip_finished)
  )

  (:action fly
    :parameters (?from - city ?to - city)
    :precondition (and
      (at ?from)
      (direct_flight ?from ?to)
      (not (trip_finished))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
    )
  )

  (:action stay_and_advance
    :parameters (?c - city ?d - day ?d_next - day ?t - count_token)
    :precondition (and
      (at ?c)
      (current_day ?d)
      (next_day ?d ?d_next)
      (unused ?t)
      (token_for_city ?t ?c)
      (not (workshop_day ?d))
      (not (trip_finished))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (unused ?t))
      (stayed_on ?c ?d)
    )
  )

  (:action stay_and_advance_workshop
    :parameters (?d - day ?d_next - day ?t - count_token)
    :precondition (and
      (at florence)
      (current_day ?d)
      (next_day ?d ?d_next)
      (workshop_day ?d)
      (unused ?t)
      (token_for_city ?t florence)
      (not (trip_finished))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (not (unused ?t))
      (stayed_on florence ?d)
      (workshop_attended)
    )
  )

  (:action stay_last_day
    :parameters (?c - city ?d - day ?t - count_token)
    :precondition (and
      (at ?c)
      (current_day ?d)
      (last_day ?d)
      (unused ?t)
      (token_for_city ?t ?c)
      (not (trip_finished))
    )
    :effect (and
      (not (current_day ?d))
      (not (unused ?t))
      (stayed_on ?c ?d)
      (trip_finished)
    )
  )
)