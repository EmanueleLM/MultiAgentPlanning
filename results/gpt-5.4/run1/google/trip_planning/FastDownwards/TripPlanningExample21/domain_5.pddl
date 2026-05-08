(define (domain tripplanningexample21)
  (:requirements :strips :typing)

  (:types city day)

  (:predicates
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (at ?c - city)
    (current_day ?d - day)
    (visited ?c - city ?d - day)
    (workshop_window ?d - day)
    (workshop_attended)
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?c)
      (current_day ?d1)
      (next ?d1 ?d2))
    :effect (and
      (current_day ?d2)
      (visited ?c ?d2)
      (not (current_day ?d1)))
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?from)
      (direct ?from ?to)
      (current_day ?d1)
      (next ?d1 ?d2))
    :effect (and
      (at ?to)
      (visited ?to ?d2)
      (current_day ?d2)
      (not (at ?from))
      (not (current_day ?d1)))
  )

  (:action attend_workshop
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (at venice)
      (visited venice ?d)
      (workshop_window ?d))
    :effect (workshop_attended))
)