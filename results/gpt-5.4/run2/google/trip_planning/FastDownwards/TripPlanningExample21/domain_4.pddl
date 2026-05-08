(define (domain tripplanningexample21)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (at ?c - city)
    (direct ?from - city ?to - city)
    (next ?d - day ?dn - day)
    (current_day ?d - day)
    (spent ?d - day ?c - city)
    (workshop_window ?d - day)
    (workshop_attended)
  )

  (:action stay
    :parameters (?c - city ?d - day ?dn - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?dn)
      (at ?c)
      (not (spent ?d ?c))
    )
    :effect (and
      (spent ?d ?c)
      (not (current_day ?d))
      (current_day ?dn)
    )
  )

  (:action attend_workshop_and_stay
    :parameters (?d - day ?dn - day)
    :precondition (and
      (current_day ?d)
      (next ?d ?dn)
      (at venice)
      (workshop_window ?d)
      (not (spent ?d venice))
      (not (workshop_attended))
    )
    :effect (and
      (spent ?d venice)
      (workshop_attended)
      (not (current_day ?d))
      (current_day ?dn)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city)
    :precondition (and
      (at ?from)
      (direct ?from ?to)
      (not (at ?to))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
    )
  )
)