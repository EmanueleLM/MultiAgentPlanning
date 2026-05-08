(define (domain european_trip_12_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (direct_flight ?from - city ?to - city)
    (current_city ?c - city)
    (next_day ?d - day)
    (day_successor ?d1 - day ?d2 - day)
    (last_day ?d - day)
    (trip_started)
    (trip_finished)
    (spent_day_in ?d - day ?c - city)
  )

  (:action choose_initial_city
    :parameters (?c - city)
    :precondition (not (trip_started))
    :effect (and
      (trip_started)
      (current_city ?c)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city)
    :precondition (and
      (trip_started)
      (current_city ?from)
      (direct_flight ?from ?to)
      (not (trip_finished))
    )
    :effect (and
      (not (current_city ?from))
      (current_city ?to)
    )
  )

  (:action stay_day_progress
    :parameters (?c - city ?d - day ?d_next - day)
    :precondition (and
      (trip_started)
      (current_city ?c)
      (next_day ?d)
      (day_successor ?d ?d_next)
      (not (trip_finished))
    )
    :effect (and
      (spent_day_in ?d ?c)
      (not (next_day ?d))
      (next_day ?d_next)
    )
  )

  (:action stay_day_finish
    :parameters (?c - city ?d - day)
    :precondition (and
      (trip_started)
      (current_city ?c)
      (next_day ?d)
      (last_day ?d)
      (not (trip_finished))
    )
    :effect (and
      (spent_day_in ?d ?c)
      (not (next_day ?d))
      (trip_finished)
    )
  )
)