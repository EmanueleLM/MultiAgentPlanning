(define (domain european_trip_10_days)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
    visit_token
  )

  (:predicates
    (next_day ?d1 - day ?d2 - day)
    (direct_flight ?from - city ?to - city)

    (at_on ?d - day ?c - city)
    (day_assigned ?d - day)
    (current_day ?d - day)

    (token_available ?t - visit_token)
    (token_used ?t - visit_token)
    (token_of_city ?t - visit_token ?c - city)

    (schedule_complete)
  )

  (:action seed_first_day
    :parameters (?c - city ?t - visit_token)
    :precondition (and
      (not (day_assigned day_1))
      (token_available ?t)
      (token_of_city ?t ?c)
    )
    :effect (and
      (at_on day_1 ?c)
      (day_assigned day_1)
      (current_day day_1)
      (token_used ?t)
      (not (token_available ?t))
    )
  )

  (:action stay_to_next_day
    :parameters (?d1 - day ?d2 - day ?c - city ?t - visit_token)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at_on ?d1 ?c)
      (not (day_assigned ?d2))
      (token_available ?t)
      (token_of_city ?t ?c)
    )
    :effect (and
      (at_on ?d2 ?c)
      (day_assigned ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (token_used ?t)
      (not (token_available ?t))
    )
  )

  (:action fly_to_next_day
    :parameters (?d1 - day ?d2 - day ?from - city ?to - city ?t - visit_token)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at_on ?d1 ?from)
      (not (day_assigned ?d2))
      (direct_flight ?from ?to)
      (not (at_on ?d1 ?to))
      (token_available ?t)
      (token_of_city ?t ?to)
    )
    :effect (and
      (at_on ?d2 ?to)
      (day_assigned ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
      (token_used ?t)
      (not (token_available ?t))
    )
  )

  (:action finalize_schedule
    :parameters ()
    :precondition (and
      (current_day day_10)
      (day_assigned day_10)
      (not (schedule_complete))
    )
    :effect (and
      (schedule_complete)
    )
  )
)