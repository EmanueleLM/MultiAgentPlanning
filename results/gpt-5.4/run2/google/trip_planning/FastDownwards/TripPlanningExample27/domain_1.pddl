(define (domain european_trip_14_days_instance)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (at ?c - city)
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (direct_flight ?from - city ?to - city)
    (occupied ?c - city ?d - day)
    (visited_santorini_window)
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?c)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (not (occupied ?c ?d2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (occupied ?c ?d2)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?from)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (direct_flight ?from ?to)
      (not (occupied ?to ?d2))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_day ?d1))
      (current_day ?d2)
      (occupied ?to ?d2)
    )
  )

  (:action mark_santorini_window
    :parameters ()
    :precondition (and
      (occupied santorini day_12)
      (occupied santorini day_13)
      (occupied santorini day_14)
      (not (visited_santorini_window))
    )
    :effect (visited_santorini_window)
  )
)