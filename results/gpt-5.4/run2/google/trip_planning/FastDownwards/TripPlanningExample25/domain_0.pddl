(define (domain european_trip_16_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
    token
  )

  (:predicates
    (next_day ?d1 - day ?d2 - day)
    (direct_flight ?from - city ?to - city)
    (show_day ?d - day)

    (at ?d - day ?c - city)

    (scheduled ?d - day)
    (day_used ?d - day)

    (token_for_city ?t - token ?c - city)
    (token_unused ?t - token)
    (token_assigned ?t - token ?d - day)

    (need_start_assignment)
  )

  (:action assign_start_day
    :parameters (?c - city ?t - token)
    :precondition (and
      (need_start_assignment)
      (not (scheduled d1))
      (not (day_used d1))
      (token_unused ?t)
      (token_for_city ?t ?c)
    )
    :effect (and
      (not (need_start_assignment))
      (at d1 ?c)
      (scheduled d1)
      (day_used d1)
      (not (token_unused ?t))
      (token_assigned ?t d1)
    )
  )

  (:action stay_to_next_day
    :parameters (?d1 - day ?d2 - day ?c - city ?t - token)
    :precondition (and
      (next_day ?d1 ?d2)
      (scheduled ?d1)
      (at ?d1 ?c)
      (not (scheduled ?d2))
      (not (day_used ?d2))
      (token_unused ?t)
      (token_for_city ?t ?c)
    )
    :effect (and
      (at ?d2 ?c)
      (scheduled ?d2)
      (day_used ?d2)
      (not (token_unused ?t))
      (token_assigned ?t ?d2)
    )
  )

  (:action fly_to_next_day
    :parameters (?d1 - day ?d2 - day ?from - city ?to - city ?t - token)
    :precondition (and
      (next_day ?d1 ?d2)
      (scheduled ?d1)
      (at ?d1 ?from)
      (direct_flight ?from ?to)
      (not (scheduled ?d2))
      (not (day_used ?d2))
      (token_unused ?t)
      (token_for_city ?t ?to)
      (not (at ?d1 ?to))
    )
    :effect (and
      (at ?d2 ?to)
      (scheduled ?d2)
      (day_used ?d2)
      (not (token_unused ?t))
      (token_assigned ?t ?d2)
    )
  )
)