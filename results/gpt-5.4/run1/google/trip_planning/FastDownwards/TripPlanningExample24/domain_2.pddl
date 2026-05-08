(define (domain european_trip_13_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (at ?c - city)
    (direct ?from - city ?to - city)
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)

    (visited_florence_day ?d - day)
    (visited_amsterdam_day ?d - day)
    (visited_riga_day ?d - day)

    (workshop_window_day ?d - day)
    (workshop_attended)
  )

  (:action stay_florence
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (at florence)
      (current_day ?d)
      (next_day ?d ?d_next)
      (not (visited_florence_day ?d))
    )
    :effect (and
      (visited_florence_day ?d)
      (not (current_day ?d))
      (current_day ?d_next)
    )
  )

  (:action stay_florence_and_attend_workshop
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (at florence)
      (current_day ?d)
      (next_day ?d ?d_next)
      (workshop_window_day ?d)
      (not (workshop_attended))
      (not (visited_florence_day ?d))
    )
    :effect (and
      (visited_florence_day ?d)
      (workshop_attended)
      (not (current_day ?d))
      (current_day ?d_next)
    )
  )

  (:action stay_amsterdam
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (at amsterdam)
      (current_day ?d)
      (next_day ?d ?d_next)
      (not (visited_amsterdam_day ?d))
    )
    :effect (and
      (visited_amsterdam_day ?d)
      (not (current_day ?d))
      (current_day ?d_next)
    )
  )

  (:action stay_riga
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (at riga)
      (current_day ?d)
      (next_day ?d ?d_next)
      (not (visited_riga_day ?d))
    )
    :effect (and
      (visited_riga_day ?d)
      (not (current_day ?d))
      (current_day ?d_next)
    )
  )

  (:action fly_florence_to_amsterdam
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (at florence)
      (direct florence amsterdam)
      (current_day ?d)
      (next_day ?d ?d_next)
      (not (visited_amsterdam_day ?d))
    )
    :effect (and
      (not (at florence))
      (at amsterdam)
      (visited_amsterdam_day ?d)
      (not (current_day ?d))
      (current_day ?d_next)
    )
  )

  (:action fly_amsterdam_to_florence
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (at amsterdam)
      (direct amsterdam florence)
      (current_day ?d)
      (next_day ?d ?d_next)
      (not (visited_florence_day ?d))
    )
    :effect (and
      (not (at amsterdam))
      (at florence)
      (visited_florence_day ?d)
      (not (current_day ?d))
      (current_day ?d_next)
    )
  )

  (:action fly_amsterdam_to_riga
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (at amsterdam)
      (direct amsterdam riga)
      (current_day ?d)
      (next_day ?d ?d_next)
      (not (visited_riga_day ?d))
    )
    :effect (and
      (not (at amsterdam))
      (at riga)
      (visited_riga_day ?d)
      (not (current_day ?d))
      (current_day ?d_next)
    )
  )

  (:action fly_riga_to_amsterdam
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (at riga)
      (direct riga amsterdam)
      (current_day ?d)
      (next_day ?d ?d_next)
      (not (visited_amsterdam_day ?d))
    )
    :effect (and
      (not (at riga))
      (at amsterdam)
      (visited_amsterdam_day ?d)
      (not (current_day ?d))
      (current_day ?d_next)
    )
  )
)