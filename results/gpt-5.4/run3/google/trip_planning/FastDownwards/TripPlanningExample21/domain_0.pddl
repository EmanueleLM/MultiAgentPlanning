(define (domain european_trip_10_days_instance)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day)

  (:predicates
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (at ?c - city ?d - day)
    (direct_flight ?from - city ?to - city)
    (workshop_window ?d - day)
    (attended_workshop)
    (day_processed ?d - day)
    (start_chosen)
  )

  (:action choose_start_mykonos
    :parameters ()
    :precondition (and
      (current_day d1)
      (not (start_chosen))
    )
    :effect (and
      (at mykonos d1)
      (day_processed d1)
      (start_chosen)
    )
  )

  (:action choose_start_vienna
    :parameters ()
    :precondition (and
      (current_day d1)
      (not (start_chosen))
    )
    :effect (and
      (at vienna d1)
      (day_processed d1)
      (start_chosen)
    )
  )

  (:action choose_start_venice
    :parameters ()
    :precondition (and
      (current_day d1)
      (not (start_chosen))
    )
    :effect (and
      (at venice d1)
      (day_processed d1)
      (start_chosen)
    )
  )

  (:action stay_next_day
    :parameters (?d1 - day ?d2 - day ?c - city)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at ?c ?d1)
      (day_processed ?d1)
      (not (day_processed ?d2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at ?c ?d2)
      (day_processed ?d2)
    )
  )

  (:action fly_next_day
    :parameters (?d1 - day ?d2 - day ?from - city ?to - city)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at ?from ?d1)
      (day_processed ?d1)
      (direct_flight ?from ?to)
      (not (day_processed ?d2))
      (not (at ?to ?d1))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (at ?to ?d2)
      (day_processed ?d2)
    )
  )

  (:action attend_workshop_on_day
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (at venice ?d)
      (workshop_window ?d)
      (not (attended_workshop))
    )
    :effect (and
      (attended_workshop)
    )
  )
)