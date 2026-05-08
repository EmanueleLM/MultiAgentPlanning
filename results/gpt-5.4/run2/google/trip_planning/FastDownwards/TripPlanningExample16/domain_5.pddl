(define (domain tripplanningexample16)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (at ?c - city)
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (current_day ?d - day)
    (spent ?c - city ?d - day)
    (workshop_window ?d - day)
    (workshop_attended)
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at ?c)
      (not (spent prague ?d2))
      (not (spent vienna ?d2))
      (not (spent porto ?d2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (spent ?c ?d2)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at ?from)
      (direct ?from ?to)
      (not (at ?to))
      (not (spent prague ?d2))
      (not (spent vienna ?d2))
      (not (spent porto ?d2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at ?from))
      (at ?to)
      (spent ?to ?d2)
    )
  )

  (:action attend_workshop
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (workshop_window ?d)
      (at prague)
      (spent prague ?d)
      (not (workshop_attended))
    )
    :effect (workshop_attended)
  )
)