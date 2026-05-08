(define (domain trip_planning_example24)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:constants
    florence amsterdam riga - city
  )

  (:predicates
    (at ?c - city)
    (direct ?from - city ?to - city)
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (last_day ?d - day)
    (in_florence_window ?d - day)
    (visited_florence_on ?d - day)
    (visited_amsterdam_on ?d - day)
    (visited_riga_on ?d - day)
    (workshop_attended)
    (trip_finished)
  )

  (:action fly
    :parameters (?from - city ?to - city)
    :precondition (and
      (at ?from)
      (direct ?from ?to)
      (not (trip_finished))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
    )
  )

  (:action stay_florence
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (at florence)
      (current_day ?d)
      (next_day ?d ?d_next)
      (not (visited_florence_on ?d))
      (not (trip_finished))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (visited_florence_on ?d)
    )
  )

  (:action stay_florence_workshop
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (at florence)
      (current_day ?d)
      (next_day ?d ?d_next)
      (in_florence_window ?d)
      (not (visited_florence_on ?d))
      (not (workshop_attended))
      (not (trip_finished))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (visited_florence_on ?d)
      (workshop_attended)
    )
  )

  (:action stay_amsterdam
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (at amsterdam)
      (current_day ?d)
      (next_day ?d ?d_next)
      (not (visited_amsterdam_on ?d))
      (not (trip_finished))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (visited_amsterdam_on ?d)
    )
  )

  (:action stay_riga
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (at riga)
      (current_day ?d)
      (next_day ?d ?d_next)
      (not (visited_riga_on ?d))
      (not (trip_finished))
    )
    :effect (and
      (not (current_day ?d))
      (current_day ?d_next)
      (visited_riga_on ?d)
    )
  )

  (:action stay_last_day_florence
    :parameters (?d - day)
    :precondition (and
      (at florence)
      (current_day ?d)
      (last_day ?d)
      (not (visited_florence_on ?d))
      (not (trip_finished))
    )
    :effect (and
      (not (current_day ?d))
      (visited_florence_on ?d)
      (trip_finished)
    )
  )

  (:action stay_last_day_florence_workshop
    :parameters (?d - day)
    :precondition (and
      (at florence)
      (current_day ?d)
      (last_day ?d)
      (in_florence_window ?d)
      (not (visited_florence_on ?d))
      (not (workshop_attended))
      (not (trip_finished))
    )
    :effect (and
      (not (current_day ?d))
      (visited_florence_on ?d)
      (workshop_attended)
      (trip_finished)
    )
  )

  (:action stay_last_day_amsterdam
    :parameters (?d - day)
    :precondition (and
      (at amsterdam)
      (current_day ?d)
      (last_day ?d)
      (not (visited_amsterdam_on ?d))
      (not (trip_finished))
    )
    :effect (and
      (not (current_day ?d))
      (visited_amsterdam_on ?d)
      (trip_finished)
    )
  )

  (:action stay_last_day_riga
    :parameters (?d - day)
    :precondition (and
      (at riga)
      (current_day ?d)
      (last_day ?d)
      (not (visited_riga_on ?d))
      (not (trip_finished))
    )
    :effect (and
      (not (current_day ?d))
      (visited_riga_on ?d)
      (trip_finished)
    )
  )
)