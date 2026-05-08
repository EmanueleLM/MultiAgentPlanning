(define (domain tripplanningexample24)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
    staycount
  )

  (:predicates
    (at ?c - city)
    (direct ?from - city ?to - city)

    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)

    (florence_remaining ?n - staycount)
    (amsterdam_remaining ?n - staycount)
    (riga_remaining ?n - staycount)
    (pred_count ?n1 - staycount ?n2 - staycount)

    (workshop_window ?d - day)
    (workshop_attended)
  )

  (:action stay_in_florence_and_attend_workshop
    :parameters (?d1 - day ?d2 - day ?n1 - staycount ?n2 - staycount)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at florence)
      (florence_remaining ?n1)
      (pred_count ?n1 ?n2)
      (workshop_window ?d1)
      (not (workshop_attended))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (florence_remaining ?n1))
      (florence_remaining ?n2)
      (workshop_attended)
    )
  )

  (:action stay_in_florence
    :parameters (?d1 - day ?d2 - day ?n1 - staycount ?n2 - staycount)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at florence)
      (florence_remaining ?n1)
      (pred_count ?n1 ?n2)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (florence_remaining ?n1))
      (florence_remaining ?n2)
    )
  )

  (:action stay_in_amsterdam
    :parameters (?d1 - day ?d2 - day ?n1 - staycount ?n2 - staycount)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at amsterdam)
      (amsterdam_remaining ?n1)
      (pred_count ?n1 ?n2)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (amsterdam_remaining ?n1))
      (amsterdam_remaining ?n2)
    )
  )

  (:action stay_in_riga
    :parameters (?d1 - day ?d2 - day ?n1 - staycount ?n2 - staycount)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at riga)
      (riga_remaining ?n1)
      (pred_count ?n1 ?n2)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (riga_remaining ?n1))
      (riga_remaining ?n2)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city)
    :precondition (and
      (at ?from)
      (not (at ?to))
      (direct ?from ?to)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
    )
  )
)