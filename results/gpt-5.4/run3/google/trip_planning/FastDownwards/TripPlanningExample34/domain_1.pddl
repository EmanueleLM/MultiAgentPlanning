(define (domain european_trip_9_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (at ?c - city)
    (direct_flight ?from - city ?to - city)
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (occupied ?d - day ?c - city)
    (visited_valencia_window)
  )

  (:action stay
    :parameters (?d - day ?d2 - day ?c - city)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at ?c)
      (not (occupied ?d frankfurt))
      (not (occupied ?d florence))
      (not (occupied ?d valencia))
    )
    :effect (and
      (occupied ?d ?c)
      (not (current_day ?d))
      (current_day ?d2)
    )
  )

  (:action fly
    :parameters (?d - day ?d2 - day ?from - city ?to - city)
    :precondition (and
      (current_day ?d)
      (next_day ?d ?d2)
      (at ?from)
      (direct_flight ?from ?to)
      (not (occupied ?d frankfurt))
      (not (occupied ?d florence))
      (not (occupied ?d valencia))
    )
    :effect (and
      (occupied ?d ?from)
      (not (at ?from))
      (at ?to)
      (not (current_day ?d))
      (current_day ?d2)
    )
  )

  (:action stay_last_day
    :parameters (?d - day ?c - city)
    :precondition (and
      (current_day ?d)
      (at ?c)
      (not (occupied ?d frankfurt))
      (not (occupied ?d florence))
      (not (occupied ?d valencia))
    )
    :effect (and
      (occupied ?d ?c)
      (not (current_day ?d))
    )
  )

  (:action mark_valencia_on_day1
    :parameters ()
    :precondition (and
      (occupied d1 valencia)
      (not (visited_valencia_window))
    )
    :effect (visited_valencia_window)
  )

  (:action mark_valencia_on_day2
    :parameters ()
    :precondition (and
      (occupied d2 valencia)
      (not (visited_valencia_window))
    )
    :effect (visited_valencia_window)
  )
)