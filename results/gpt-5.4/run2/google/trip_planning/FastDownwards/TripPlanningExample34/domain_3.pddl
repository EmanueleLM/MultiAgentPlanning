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
    (visited_valencia_window)
  )

  (:action start_in_city
    :parameters (?c - city)
    :precondition (and
      (current_day day_1)
      (not (at frankfurt day_1))
      (not (at florence day_1))
      (not (at valencia day_1))
    )
    :effect (at ?c day_1)
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at ?c ?d1)
      (not (at frankfurt ?d2))
      (not (at florence ?d2))
      (not (at valencia ?d2))
    )
    :effect (and
      (at ?c ?d2)
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
      (not (at frankfurt ?d2))
      (not (at florence ?d2))
      (not (at valencia ?d2))
    )
    :effect (and
      (at ?to ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action mark_valencia_day_1
    :parameters ()
    :precondition (and
      (at valencia day_1)
      (not (visited_valencia_window))
    )
    :effect (visited_valencia_window)
  )

  (:action mark_valencia_day_2
    :parameters ()
    :precondition (and
      (at valencia day_2)
      (not (visited_valencia_window))
    )
    :effect (visited_valencia_window)
  )
)