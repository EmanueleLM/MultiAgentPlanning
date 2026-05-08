(define (domain tripplanningexample31)
  (:requirements :strips :typing)

  (:types
    city
    day
  )

  (:predicates
    (at ?c - city)
    (direct ?from - city ?to - city)
    (next ?d - day ?nd - day)
    (today ?d - day)
    (occupied ?c - city ?d - day)
    (workshop_window ?d - day)
    (workshop_attended)
  )

  (:action stay
    :parameters (?c - city ?d - day ?nd - day)
    :precondition (and
      (at ?c)
      (today ?d)
      (next ?d ?nd)
    )
    :effect (and
      (occupied ?c ?d)
      (not (today ?d))
      (today ?nd)
    )
  )

  (:action attend_workshop
    :parameters (?d - day ?nd - day)
    :precondition (and
      (at reykjavik)
      (today ?d)
      (next ?d ?nd)
      (workshop_window ?d)
    )
    :effect (and
      (occupied reykjavik ?d)
      (workshop_attended)
      (not (today ?d))
      (today ?nd)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d - day ?nd - day)
    :precondition (and
      (at ?from)
      (today ?d)
      (next ?d ?nd)
      (direct ?from ?to)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (today ?d))
      (today ?nd)
    )
  )
)