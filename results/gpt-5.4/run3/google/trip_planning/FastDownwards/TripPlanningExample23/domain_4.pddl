(define (domain tripplanningexample23)
  (:requirements :strips :typing)

  (:types
    city
    day
  )

  (:predicates
    (at ?c - city)
    (direct ?from - city ?to - city)
    (next ?d - day ?d2 - day)
    (current_day ?d - day)
    (spent ?c - city ?d - day)
    (workshop_window ?d - day)
    (workshop_attended ?d - day)
  )

  (:action stay
    :parameters (?c - city ?d - day ?d2 - day)
    :precondition (and
      (at ?c)
      (current_day ?d)
      (next ?d ?d2)
    )
    :effect (and
      (spent ?c ?d)
      (not (current_day ?d))
      (current_day ?d2)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d - day ?d2 - day)
    :precondition (and
      (at ?from)
      (current_day ?d)
      (next ?d ?d2)
      (direct ?from ?to)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (spent ?to ?d)
      (not (current_day ?d))
      (current_day ?d2)
    )
  )

  (:action attend_workshop
    :parameters (?d - day ?d2 - day)
    :precondition (and
      (at riga)
      (current_day ?d)
      (next ?d ?d2)
      (workshop_window ?d)
    )
    :effect (and
      (spent riga ?d)
      (workshop_attended ?d)
      (not (current_day ?d))
      (current_day ?d2)
    )
  )
)