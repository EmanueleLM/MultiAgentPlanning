(define (domain tripplanningexample31)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (at ?c - city)
    (direct ?from - city ?to - city)
    (next ?d - day ?nd - day)
    (current_day ?d - day)
    (spent ?c - city ?d - day)
    (workshop_day ?d - day)
    (workshop_attended)
  )

  (:action stay
    :parameters (?c - city ?d - day ?nd - day)
    :precondition (and
      (at ?c)
      (current_day ?d)
      (next ?d ?nd)
      (not (spent ?c ?d))
    )
    :effect (and
      (spent ?c ?d)
      (not (current_day ?d))
      (current_day ?nd)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d - day)
    :precondition (and
      (at ?from)
      (current_day ?d)
      (direct ?from ?to)
      (not (= ?from ?to))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
    )
  )

  (:action attend_workshop
    :parameters (?d - day ?nd - day)
    :precondition (and
      (at reykjavik)
      (current_day ?d)
      (next ?d ?nd)
      (workshop_day ?d)
      (not (workshop_attended))
      (not (spent reykjavik ?d))
    )
    :effect (and
      (spent reykjavik ?d)
      (workshop_attended)
      (not (current_day ?d))
      (current_day ?nd)
    )
  )
)