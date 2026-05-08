(define (domain tripplanningexample21)
  (:requirements :strips :typing :negative-preconditions)

  (:types city day)

  (:predicates
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)

    (current_day ?d - day)
    (at ?c - city)

    (occupied ?c - city ?d - day)

    (workshop_window ?d - day)
    (workshop_attended)

    (goal_day ?d - day)
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?c)
      (current_day ?d1)
      (next ?d1 ?d2)
      (not (occupied mykonos ?d2))
      (not (occupied vienna ?d2))
      (not (occupied venice ?d2)))
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (occupied ?c ?d2))
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?from)
      (direct ?from ?to)
      (current_day ?d1)
      (next ?d1 ?d2)
      (not (occupied mykonos ?d2))
      (not (occupied vienna ?d2))
      (not (occupied venice ?d2)))
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_day ?d1))
      (current_day ?d2)
      (occupied ?to ?d2))
  )

  (:action attend_workshop
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (goal_day ?d)
      (at venice)
      (occupied venice ?d)
      (workshop_window ?d)
      (not (workshop_attended)))
    :effect (workshop_attended))
)