(define (domain european_trip_10_days_instance)
  (:requirements :strips :typing)

  (:types city day)

  (:predicates
    (at ?c - city)
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (current ?d - day)
    (visited ?c - city ?d - day)
    (workshop_window ?d - day)
    (workshop_done)
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?c)
      (current ?d1)
      (next ?d1 ?d2))
    :effect (and
      (not (current ?d1))
      (current ?d2)
      (visited ?c ?d2))
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?from)
      (direct ?from ?to)
      (current ?d1)
      (next ?d1 ?d2))
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current ?d1))
      (current ?d2)
      (visited ?to ?d2))
  )

  (:action attend_workshop
    :parameters (?d - day)
    :precondition (and
      (current ?d)
      (at venice)
      (workshop_window ?d)
      (not (workshop_done)))
    :effect (workshop_done)
  )
)