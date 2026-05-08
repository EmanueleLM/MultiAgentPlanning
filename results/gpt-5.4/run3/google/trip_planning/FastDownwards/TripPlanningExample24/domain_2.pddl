(define (domain tripplanningexample24)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
    stay_count
  )

  (:predicates
    (at ?c - city)
    (direct ?from - city ?to - city)

    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)

    (remaining_florence ?n - stay_count)
    (remaining_amsterdam ?n - stay_count)
    (remaining_riga ?n - stay_count)
    (next_count ?n1 - stay_count ?n2 - stay_count)

    (workshop_window ?d - day)
    (workshop_done)
  )

  (:action stay_in_florence_and_attend_workshop
    :parameters (?d1 - day ?d2 - day ?n1 - stay_count ?n2 - stay_count)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at florence)
      (remaining_florence ?n1)
      (next_count ?n1 ?n2)
      (workshop_window ?d1)
      (not (workshop_done))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (remaining_florence ?n1))
      (remaining_florence ?n2)
      (workshop_done)
    )
  )

  (:action stay_in_florence
    :parameters (?d1 - day ?d2 - day ?n1 - stay_count ?n2 - stay_count)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at florence)
      (remaining_florence ?n1)
      (next_count ?n1 ?n2)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (remaining_florence ?n1))
      (remaining_florence ?n2)
    )
  )

  (:action stay_in_amsterdam
    :parameters (?d1 - day ?d2 - day ?n1 - stay_count ?n2 - stay_count)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at amsterdam)
      (remaining_amsterdam ?n1)
      (next_count ?n1 ?n2)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (remaining_amsterdam ?n1))
      (remaining_amsterdam ?n2)
    )
  )

  (:action stay_in_riga
    :parameters (?d1 - day ?d2 - day ?n1 - stay_count ?n2 - stay_count)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at riga)
      (remaining_riga ?n1)
      (next_count ?n1 ?n2)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (remaining_riga ?n1))
      (remaining_riga ?n2)
    )
  )

  (:action fly_to_florence_and_attend_workshop
    :parameters (?from - city ?d1 - day ?d2 - day ?n1 - stay_count ?n2 - stay_count)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at ?from)
      (not (at florence))
      (direct ?from florence)
      (remaining_florence ?n1)
      (next_count ?n1 ?n2)
      (workshop_window ?d1)
      (not (workshop_done))
    )
    :effect (and
      (not (at ?from))
      (at florence)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (remaining_florence ?n1))
      (remaining_florence ?n2)
      (workshop_done)
    )
  )

  (:action fly_to_florence
    :parameters (?from - city ?d1 - day ?d2 - day ?n1 - stay_count ?n2 - stay_count)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at ?from)
      (not (at florence))
      (direct ?from florence)
      (remaining_florence ?n1)
      (next_count ?n1 ?n2)
    )
    :effect (and
      (not (at ?from))
      (at florence)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (remaining_florence ?n1))
      (remaining_florence ?n2)
    )
  )

  (:action fly_to_amsterdam
    :parameters (?from - city ?d1 - day ?d2 - day ?n1 - stay_count ?n2 - stay_count)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at ?from)
      (not (at amsterdam))
      (direct ?from amsterdam)
      (remaining_amsterdam ?n1)
      (next_count ?n1 ?n2)
    )
    :effect (and
      (not (at ?from))
      (at amsterdam)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (remaining_amsterdam ?n1))
      (remaining_amsterdam ?n2)
    )
  )

  (:action fly_to_riga
    :parameters (?from - city ?d1 - day ?d2 - day ?n1 - stay_count ?n2 - stay_count)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at ?from)
      (not (at riga))
      (direct ?from riga)
      (remaining_riga ?n1)
      (next_count ?n1 ?n2)
    )
    :effect (and
      (not (at ?from))
      (at riga)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (remaining_riga ?n1))
      (remaining_riga ?n2)
    )
  )
)