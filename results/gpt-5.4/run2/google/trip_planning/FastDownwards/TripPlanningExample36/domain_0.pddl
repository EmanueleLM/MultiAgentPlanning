(define (domain european_trip_13_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city day token
  )

  (:predicates
    (direct ?from - city ?to - city)
    (next_day ?d1 - day ?d2 - day)
    (first_day ?d - day)
    (last_day ?d - day)

    (current_day ?d - day)
    (assigned ?d - day)
    (city_on ?d - day ?c - city)
    (previous_city ?c - city)

    (token_for_city ?t - token ?c - city)
    (unused ?t - token)
    (used ?t - token)

    (trip_complete)
  )

  (:action start_in_city
    :parameters (?d - day ?dnext - day ?c - city ?t - token)
    :precondition (and
      (first_day ?d)
      (current_day ?d)
      (next_day ?d ?dnext)
      (token_for_city ?t ?c)
      (unused ?t)
    )
    :effect (and
      (assigned ?d)
      (city_on ?d ?c)
      (used ?t)
      (previous_city ?c)
      (current_day ?dnext)
      (not (current_day ?d))
      (not (unused ?t))
    )
  )

  (:action spend_next_day_stay
    :parameters (?d - day ?dnext - day ?c - city ?t - token)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dnext)
      (previous_city ?c)
      (token_for_city ?t ?c)
      (unused ?t)
      (not (first_day ?d))
    )
    :effect (and
      (assigned ?d)
      (city_on ?d ?c)
      (used ?t)
      (current_day ?dnext)
      (not (current_day ?d))
      (not (unused ?t))
    )
  )

  (:action spend_next_day_fly
    :parameters (?d - day ?dnext - day ?from - city ?to - city ?t - token)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?dnext)
      (previous_city ?from)
      (direct ?from ?to)
      (token_for_city ?t ?to)
      (unused ?t)
      (not (first_day ?d))
      (not (previous_city ?to))
    )
    :effect (and
      (assigned ?d)
      (city_on ?d ?to)
      (used ?t)
      (previous_city ?to)
      (current_day ?dnext)
      (not (current_day ?d))
      (not (unused ?t))
      (not (previous_city ?from))
    )
  )

  (:action spend_last_day_stay
    :parameters (?d - day ?c - city ?t - token)
    :precondition (and
      (current_day ?d)
      (last_day ?d)
      (previous_city ?c)
      (token_for_city ?t ?c)
      (unused ?t)
      (not (first_day ?d))
    )
    :effect (and
      (assigned ?d)
      (city_on ?d ?c)
      (used ?t)
      (trip_complete)
      (not (current_day ?d))
      (not (unused ?t))
    )
  )

  (:action spend_last_day_fly
    :parameters (?d - day ?from - city ?to - city ?t - token)
    :precondition (and
      (current_day ?d)
      (last_day ?d)
      (previous_city ?from)
      (direct ?from ?to)
      (token_for_city ?t ?to)
      (unused ?t)
      (not (first_day ?d))
      (not (previous_city ?to))
    )
    :effect (and
      (assigned ?d)
      (city_on ?d ?to)
      (used ?t)
      (previous_city ?to)
      (trip_complete)
      (not (current_day ?d))
      (not (unused ?t))
      (not (previous_city ?from))
    )
  )
)