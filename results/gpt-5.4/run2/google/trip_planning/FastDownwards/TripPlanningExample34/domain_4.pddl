(define (domain european_trip_9_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (current_day ?d - day)
    (at ?c - city ?d - day)
    (occupied ?d - day)
    (visited_valencia_window)
  )

  (:action start_in_city
    :parameters (?c - city)
    :precondition (and
      (current_day day1)
      (not (occupied day1))
    )
    :effect (and
      (at ?c day1)
      (occupied day1)
    )
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at ?c ?d1)
      (not (occupied ?d2))
    )
    :effect (and
      (at ?c ?d2)
      (occupied ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at ?from ?d1)
      (direct ?from ?to)
      (not (occupied ?d2))
    )
    :effect (and
      (at ?to ?d2)
      (occupied ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action mark_valencia_day1
    :parameters ()
    :precondition (and
      (at valencia day1)
      (not (visited_valencia_window))
    )
    :effect (visited_valencia_window)
  )

  (:action mark_valencia_day2
    :parameters ()
    :precondition (and
      (at valencia day2)
      (not (visited_valencia_window))
    )
    :effect (visited_valencia_window)
  )
)