(define (domain tripplanningexample23)
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
      (at ?c)
      (current_day ?d1)
      (next ?d1 ?d2)
      (not (spent ?c ?d1))
    )
    :effect (and
      (spent ?c ?d1)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?from)
      (current_day ?d1)
      (next ?d1 ?d2)
      (direct ?from ?to)
      (not (spent ?to ?d1))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (spent ?to ?d1)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action attend_workshop
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (at riga)
      (current_day ?d1)
      (next ?d1 ?d2)
      (workshop_window ?d1)
      (not (workshop_attended))
      (not (spent riga ?d1))
    )
    :effect (and
      (spent riga ?d1)
      (workshop_attended)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )
)