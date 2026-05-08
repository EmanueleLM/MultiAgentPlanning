(define (domain european_trip_11_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city day
  )

  (:predicates
    (at ?c - city)
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (direct_flight ?from - city ?to - city)
    (visited_on ?c - city ?d - day)
    (day_assigned ?d - day)
    (not_started)
    (trip_finished)
  )

  (:action start_in_city
    :parameters (?c - city)
    :precondition (not_started)
    :effect (and
      (at ?c)
      (current_day day_1)
      (not (not_started))
    )
  )

  (:action stay_and_advance
    :parameters (?c - city ?d - day ?d_next - day)
    :precondition (and
      (at ?c)
      (current_day ?d)
      (next_day ?d ?d_next)
      (not (day_assigned ?d))
    )
    :effect (and
      (visited_on ?c ?d)
      (day_assigned ?d)
      (not (current_day ?d))
      (current_day ?d_next)
    )
  )

  (:action fly_after_day
    :parameters (?from - city ?to - city ?d - day ?d_next - day)
    :precondition (and
      (at ?from)
      (current_day ?d)
      (next_day ?d ?d_next)
      (direct_flight ?from ?to)
      (not (day_assigned ?d))
      (not (= ?from ?to))
    )
    :effect (and
      (visited_on ?from ?d)
      (day_assigned ?d)
      (not (at ?from))
      (at ?to)
      (not (current_day ?d))
      (current_day ?d_next)
    )
  )

  (:action finish_last_day
    :parameters (?c - city ?d - day)
    :precondition (and
      (at ?c)
      (current_day ?d)
      (not (day_assigned ?d))
    )
    :effect (and
      (visited_on ?c ?d)
      (day_assigned ?d)
      (trip_finished)
      (not (current_day ?d))
    )
  )
)