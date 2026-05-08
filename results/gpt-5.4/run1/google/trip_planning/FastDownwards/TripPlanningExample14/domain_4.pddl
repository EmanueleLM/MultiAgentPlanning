(define (domain trip_planning_example14)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (current_day ?d - day)
    (at ?c - city)
    (occupied ?d - day ?c - city)
    (show_day ?d - day)
    (goal_day_city ?d - day ?c - city)
    (last_day ?d - day)
    (required_final ?c - city)
    (trip_finished)
  )

  (:action stay
    :parameters (?d - day ?d_next - day ?c - city)
    :precondition (and
      (current_day ?d)
      (next ?d ?d_next)
      (at ?c)
      (goal_day_city ?d ?c)
      (not (occupied ?d ?c))
      (not (trip_finished))
    )
    :effect (and
      (occupied ?d ?c)
      (not (current_day ?d))
      (current_day ?d_next)
    )
  )

  (:action fly
    :parameters (?d - day ?d_next - day ?from - city ?to - city)
    :precondition (and
      (current_day ?d)
      (next ?d ?d_next)
      (at ?from)
      (direct ?from ?to)
      (goal_day_city ?d ?from)
      (goal_day_city ?d_next ?to)
      (not (occupied ?d ?from))
      (not (trip_finished))
    )
    :effect (and
      (occupied ?d ?from)
      (not (current_day ?d))
      (current_day ?d_next)
      (not (at ?from))
      (at ?to)
    )
  )

  (:action stay_last_day
    :parameters (?d - day ?c - city)
    :precondition (and
      (current_day ?d)
      (last_day ?d)
      (at ?c)
      (goal_day_city ?d ?c)
      (required_final ?c)
      (not (occupied ?d ?c))
      (not (trip_finished))
    )
    :effect (and
      (occupied ?d ?c)
      (not (current_day ?d))
      (trip_finished)
    )
  )
)