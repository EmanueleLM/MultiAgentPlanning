(define (domain european_trip_9_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (at ?c - city)
    (direct ?from - city ?to - city)
    (current_day ?d - day)
    (next ?d1 - day ?d2 - day)
    (last_day ?d - day)
    (spent ?d - day ?c - city)
    (required ?d - day ?c - city)
    (window_day ?d - day)
    (window_satisfied)
    (trip_complete)
  )

  (:action start_trip
    :parameters (?c - city)
    :precondition (and
      (current_day day1)
      (not (at oslo))
      (not (at dublin))
      (not (at valencia))
    )
    :effect (at ?c)
  )

  (:action stay_and_advance
    :parameters (?d - day ?d2 - day ?c - city)
    :precondition (and
      (current_day ?d)
      (next ?d ?d2)
      (at ?c)
      (required ?d ?c)
      (not (spent ?d oslo))
      (not (spent ?d dublin))
      (not (spent ?d valencia))
    )
    :effect (and
      (spent ?d ?c)
      (not (current_day ?d))
      (current_day ?d2)
    )
  )

  (:action fly_and_advance
    :parameters (?d - day ?d2 - day ?from - city ?to - city)
    :precondition (and
      (current_day ?d)
      (next ?d ?d2)
      (at ?from)
      (direct ?from ?to)
      (required ?d ?to)
      (not (spent ?d oslo))
      (not (spent ?d dublin))
      (not (spent ?d valencia))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (spent ?d ?to)
      (not (current_day ?d))
      (current_day ?d2)
    )
  )

  (:action satisfy_window_on_valencia_day
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?d2)
      (at valencia)
      (required ?d valencia)
      (window_day ?d)
      (not (spent ?d oslo))
      (not (spent ?d dublin))
      (not (spent ?d valencia))
      (not (window_satisfied))
    )
    :effect (and
      (spent ?d valencia)
      (window_satisfied)
      (not (current_day ?d))
      (current_day ?d2)
    )
  )

  (:action fly_to_valencia_and_satisfy_window
    :parameters (?d - day ?d2 - day ?from - city)
    :precondition (and
      (current_day ?d)
      (next ?d ?d2)
      (at ?from)
      (direct ?from valencia)
      (required ?d valencia)
      (window_day ?d)
      (not (spent ?d oslo))
      (not (spent ?d dublin))
      (not (spent ?d valencia))
      (not (window_satisfied))
    )
    :effect (and
      (not (at ?from))
      (at valencia)
      (spent ?d valencia)
      (window_satisfied)
      (not (current_day ?d))
      (current_day ?d2)
    )
  )

  (:action stay_last_day
    :parameters (?d - day ?c - city)
    :precondition (and
      (current_day ?d)
      (last_day ?d)
      (at ?c)
      (required ?d ?c)
      (window_satisfied)
      (not (spent ?d oslo))
      (not (spent ?d dublin))
      (not (spent ?d valencia))
    )
    :effect (and
      (spent ?d ?c)
      (not (current_day ?d))
      (trip_complete)
    )
  )

  (:action fly_last_day
    :parameters (?d - day ?from - city ?to - city)
    :precondition (and
      (current_day ?d)
      (last_day ?d)
      (at ?from)
      (direct ?from ?to)
      (required ?d ?to)
      (window_satisfied)
      (not (spent ?d oslo))
      (not (spent ?d dublin))
      (not (spent ?d valencia))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (spent ?d ?to)
      (not (current_day ?d))
      (trip_complete)
    )
  )

  (:action satisfy_window_on_last_valencia_day
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (last_day ?d)
      (at valencia)
      (required ?d valencia)
      (window_day ?d)
      (not (spent ?d oslo))
      (not (spent ?d dublin))
      (not (spent ?d valencia))
    )
    :effect (and
      (spent ?d valencia)
      (window_satisfied)
      (not (current_day ?d))
      (trip_complete)
    )
  )

  (:action fly_to_last_valencia_day_and_satisfy_window
    :parameters (?d - day ?from - city)
    :precondition (and
      (current_day ?d)
      (last_day ?d)
      (at ?from)
      (direct ?from valencia)
      (required ?d valencia)
      (window_day ?d)
      (not (spent ?d oslo))
      (not (spent ?d dublin))
      (not (spent ?d valencia))
    )
    :effect (and
      (not (at ?from))
      (at valencia)
      (spent ?d valencia)
      (window_satisfied)
      (not (current_day ?d))
      (trip_complete)
    )
  )
)