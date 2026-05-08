(define (domain european_trip_10_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types city day)

  (:predicates
    (at ?c - city)
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (current_day ?d - day)
    (visited ?c - city ?d - day)
    (free_day ?d - day)
    (workshop_window ?d - day)
    (workshop_done)
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?c)
      (current_day ?d1)
      (next ?d1 ?d2)
      (free_day ?d1)
      (not (visited ?c ?d2)))
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (free_day ?d1))
      (visited ?c ?d2))
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?from)
      (direct ?from ?to)
      (current_day ?d1)
      (next ?d1 ?d2)
      (free_day ?d1)
      (not (visited ?to ?d2)))
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_day ?d1))
      (current_day ?d2)
      (not (free_day ?d1))
      (visited ?to ?d2))
  )

  (:action attend_workshop
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (at venice)
      (workshop_window ?d)
      (free_day ?d)
      (not (workshop_done)))
    :effect (and
      (workshop_done)
      (not (free_day ?d)))
  )
)