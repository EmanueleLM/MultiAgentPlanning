(define (domain tripplanningexample24)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
    count
  )

  (:predicates
    (at ?c - city)
    (direct ?from - city ?to - city)

    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)

    (florence_left ?n - count)
    (amsterdam_left ?n - count)
    (riga_left ?n - count)
    (decrease ?from - count ?to - count)

    (workshop_window ?d - day)
    (workshop_done)
  )

  (:action stay_florence_and_attend_workshop
    :parameters (?d1 - day ?d2 - day ?n1 - count ?n2 - count)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at florence)
      (florence_left ?n1)
      (decrease ?n1 ?n2)
      (workshop_window ?d1)
      (not (workshop_done))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (florence_left ?n1))
      (florence_left ?n2)
      (workshop_done)
    )
  )

  (:action stay_florence
    :parameters (?d1 - day ?d2 - day ?n1 - count ?n2 - count)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at florence)
      (florence_left ?n1)
      (decrease ?n1 ?n2)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (florence_left ?n1))
      (florence_left ?n2)
    )
  )

  (:action stay_amsterdam
    :parameters (?d1 - day ?d2 - day ?n1 - count ?n2 - count)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at amsterdam)
      (amsterdam_left ?n1)
      (decrease ?n1 ?n2)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (amsterdam_left ?n1))
      (amsterdam_left ?n2)
    )
  )

  (:action stay_riga
    :parameters (?d1 - day ?d2 - day ?n1 - count ?n2 - count)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at riga)
      (riga_left ?n1)
      (decrease ?n1 ?n2)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (riga_left ?n1))
      (riga_left ?n2)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at ?from)
      (not (at ?to))
      (direct ?from ?to)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )
)