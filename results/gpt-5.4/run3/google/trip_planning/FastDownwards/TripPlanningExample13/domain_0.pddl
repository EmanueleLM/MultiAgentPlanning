(define (domain european_trip_17_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city day visit_token
  )

  (:predicates
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (last_day ?d - day)

    (at ?c - city)
    (started)

    (direct_flight ?from - city ?to - city)

    (day_assigned ?d - day)

    (token_for_city ?t - visit_token ?c - city)
    (unused ?t - visit_token)
    (claimed ?t - visit_token)

    (window_day ?d - day)
    (visited_lyon_in_window)

    (trip_complete)
  )

  (:action choose_start_city
    :parameters (?c - city)
    :precondition (and
      (not (started))
      (not (trip_complete))
    )
    :effect (and
      (started)
      (at ?c)
    )
  )

  (:action stay_and_assign
    :parameters (?d - day ?d_next - day ?c - city ?t - visit_token)
    :precondition (and
      (started)
      (current_day ?d)
      (next_day ?d ?d_next)
      (at ?c)
      (token_for_city ?t ?c)
      (unused ?t)
      (not (window_day ?d))
      (not (day_assigned ?d))
    )
    :effect (and
      (day_assigned ?d)
      (claimed ?t)
      (not (unused ?t))
      (not (current_day ?d))
      (current_day ?d_next)
    )
  )

  (:action stay_and_assign_last_day
    :parameters (?d - day ?c - city ?t - visit_token)
    :precondition (and
      (started)
      (current_day ?d)
      (last_day ?d)
      (at ?c)
      (token_for_city ?t ?c)
      (unused ?t)
      (not (window_day ?d))
      (not (day_assigned ?d))
    )
    :effect (and
      (day_assigned ?d)
      (claimed ?t)
      (not (unused ?t))
      (not (current_day ?d))
      (trip_complete)
    )
  )

  (:action fly_and_assign
    :parameters (?d - day ?d_next - day ?from - city ?to - city ?t - visit_token)
    :precondition (and
      (started)
      (current_day ?d)
      (next_day ?d ?d_next)
      (at ?from)
      (direct_flight ?from ?to)
      (token_for_city ?t ?to)
      (unused ?t)
      (not (window_day ?d))
      (not (day_assigned ?d))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (day_assigned ?d)
      (claimed ?t)
      (not (unused ?t))
      (not (current_day ?d))
      (current_day ?d_next)
    )
  )

  (:action fly_and_assign_last_day
    :parameters (?d - day ?from - city ?to - city ?t - visit_token)
    :precondition (and
      (started)
      (current_day ?d)
      (last_day ?d)
      (at ?from)
      (direct_flight ?from ?to)
      (token_for_city ?t ?to)
      (unused ?t)
      (not (window_day ?d))
      (not (day_assigned ?d))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (day_assigned ?d)
      (claimed ?t)
      (not (unused ?t))
      (not (current_day ?d))
      (trip_complete)
    )
  )

  (:action stay_in_lyon_window_and_assign
    :parameters (?d - day ?d_next - day ?t - visit_token)
    :precondition (and
      (started)
      (current_day ?d)
      (next_day ?d ?d_next)
      (at lyon)
      (window_day ?d)
      (token_for_city ?t lyon)
      (unused ?t)
      (not (day_assigned ?d))
    )
    :effect (and
      (day_assigned ?d)
      (claimed ?t)
      (not (unused ?t))
      (visited_lyon_in_window)
      (not (current_day ?d))
      (current_day ?d_next)
    )
  )

  (:action stay_in_lyon_window_and_assign_last_day
    :parameters (?d - day ?t - visit_token)
    :precondition (and
      (started)
      (current_day ?d)
      (last_day ?d)
      (at lyon)
      (window_day ?d)
      (token_for_city ?t lyon)
      (unused ?t)
      (not (day_assigned ?d))
    )
    :effect (and
      (day_assigned ?d)
      (claimed ?t)
      (not (unused ?t))
      (visited_lyon_in_window)
      (not (current_day ?d))
      (trip_complete)
    )
  )

  (:action fly_to_lyon_in_window_and_assign
    :parameters (?d - day ?d_next - day ?from - city ?t - visit_token)
    :precondition (and
      (started)
      (current_day ?d)
      (next_day ?d ?d_next)
      (at ?from)
      (direct_flight ?from lyon)
      (window_day ?d)
      (token_for_city ?t lyon)
      (unused ?t)
      (not (day_assigned ?d))
    )
    :effect (and
      (not (at ?from))
      (at lyon)
      (day_assigned ?d)
      (claimed ?t)
      (not (unused ?t))
      (visited_lyon_in_window)
      (not (current_day ?d))
      (current_day ?d_next)
    )
  )

  (:action fly_to_lyon_in_window_and_assign_last_day
    :parameters (?d - day ?from - city ?t - visit_token)
    :precondition (and
      (started)
      (current_day ?d)
      (last_day ?d)
      (at ?from)
      (direct_flight ?from lyon)
      (window_day ?d)
      (token_for_city ?t lyon)
      (unused ?t)
      (not (day_assigned ?d))
    )
    :effect (and
      (not (at ?from))
      (at lyon)
      (day_assigned ?d)
      (claimed ?t)
      (not (unused ?t))
      (visited_lyon_in_window)
      (not (current_day ?d))
      (trip_complete)
    )
  )
)