(define (domain european_trip_11_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
    visit_token
  )

  (:predicates
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (current_city ?c - city)
    (direct_flight ?from - city ?to - city)
    (occupied ?d - day ?c - city)
    (day_assigned ?d - day)
    (token_for_city ?t - visit_token ?c - city)
    (token_unused ?t - visit_token)
    (token_used ?t - visit_token)
    (final_day ?d - day)
    (trip_complete)
  )

  (:action initialize_day_1_copenhagen
    :parameters (?t - visit_token)
    :precondition (and
      (current_day day_1)
      (current_city copenhagen)
      (token_for_city ?t copenhagen)
      (token_unused ?t)
      (not (day_assigned day_1))
    )
    :effect (and
      (occupied day_1 copenhagen)
      (day_assigned day_1)
      (token_used ?t)
      (not (token_unused ?t))
    )
  )

  (:action stay_nonconference
    :parameters (?d1 - day ?d2 - day ?c - city ?t - visit_token)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (current_city ?c)
      (day_assigned ?d1)
      (not (day_assigned ?d2))
      (token_for_city ?t ?c)
      (token_unused ?t)
      (not (= ?d2 day_5))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (occupied ?d2 ?c)
      (day_assigned ?d2)
      (token_used ?t)
      (not (token_unused ?t))
    )
  )

  (:action stay_to_day_5_copenhagen
    :parameters (?t - visit_token)
    :precondition (and
      (current_day day_4)
      (next_day day_4 day_5)
      (current_city copenhagen)
      (day_assigned day_4)
      (not (day_assigned day_5))
      (token_for_city ?t copenhagen)
      (token_unused ?t)
    )
    :effect (and
      (not (current_day day_4))
      (current_day day_5)
      (occupied day_5 copenhagen)
      (day_assigned day_5)
      (token_used ?t)
      (not (token_unused ?t))
    )
  )

  (:action fly_nonconference
    :parameters (?d1 - day ?d2 - day ?from - city ?to - city ?t - visit_token)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (current_city ?from)
      (direct_flight ?from ?to)
      (not (= ?from ?to))
      (day_assigned ?d1)
      (not (day_assigned ?d2))
      (token_for_city ?t ?to)
      (token_unused ?t)
      (not (= ?d2 day_5))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (current_city ?from))
      (current_city ?to)
      (occupied ?d2 ?to)
      (day_assigned ?d2)
      (token_used ?t)
      (not (token_unused ?t))
    )
  )

  (:action fly_to_day_5_copenhagen
    :parameters (?from - city ?t - visit_token)
    :precondition (and
      (current_day day_4)
      (next_day day_4 day_5)
      (current_city ?from)
      (direct_flight ?from copenhagen)
      (not (= ?from copenhagen))
      (day_assigned day_4)
      (not (day_assigned day_5))
      (token_for_city ?t copenhagen)
      (token_unused ?t)
    )
    :effect (and
      (not (current_day day_4))
      (current_day day_5)
      (not (current_city ?from))
      (current_city copenhagen)
      (occupied day_5 copenhagen)
      (day_assigned day_5)
      (token_used ?t)
      (not (token_unused ?t))
    )
  )

  (:action finish_trip
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (final_day ?d)
      (day_assigned ?d)
    )
    :effect (and
      (trip_complete)
    )
  )
)