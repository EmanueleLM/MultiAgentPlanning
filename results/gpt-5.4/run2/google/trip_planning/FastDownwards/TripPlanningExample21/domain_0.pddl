(define (domain european_trip_10_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city day count
  )

  (:predicates
    (at ?c - city)
    (direct ?from - city ?to - city)
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)

    (spent_venice ?n - count)
    (next_venice_count ?n1 - count ?n2 - count)

    (spent_mykonos ?n - count)
    (next_mykonos_count ?n1 - count ?n2 - count)

    (spent_vienna ?n - count)
    (next_vienna_count ?n1 - count ?n2 - count)

    (workshop_attended)
    (workshop_day ?d - day)
    (nonworkshop_day ?d - day)
  )

  (:action fly
    :parameters (?from - city ?to - city)
    :precondition (and
      (at ?from)
      (direct ?from ?to)
      (not (at ?to))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
    )
  )

  (:action spend_day_in_venice_window
    :parameters (?d1 - day ?d2 - day ?n1 - count ?n2 - count)
    :precondition (and
      (at venice)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (workshop_day ?d1)
      (spent_venice ?n1)
      (next_venice_count ?n1 ?n2)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (spent_venice ?n1))
      (spent_venice ?n2)
      (workshop_attended)
    )
  )

  (:action spend_day_in_venice_nonwindow
    :parameters (?d1 - day ?d2 - day ?n1 - count ?n2 - count)
    :precondition (and
      (at venice)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (nonworkshop_day ?d1)
      (spent_venice ?n1)
      (next_venice_count ?n1 ?n2)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (spent_venice ?n1))
      (spent_venice ?n2)
    )
  )

  (:action spend_day_in_mykonos
    :parameters (?d1 - day ?d2 - day ?n1 - count ?n2 - count)
    :precondition (and
      (at mykonos)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (spent_mykonos ?n1)
      (next_mykonos_count ?n1 ?n2)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (spent_mykonos ?n1))
      (spent_mykonos ?n2)
    )
  )

  (:action spend_day_in_vienna
    :parameters (?d1 - day ?d2 - day ?n1 - count ?n2 - count)
    :precondition (and
      (at vienna)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (spent_vienna ?n1)
      (next_vienna_count ?n1 ?n2)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (spent_vienna ?n1))
      (spent_vienna ?n2)
    )
  )
)