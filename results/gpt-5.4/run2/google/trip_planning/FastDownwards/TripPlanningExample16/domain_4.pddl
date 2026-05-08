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
    (workshop_day ?d - day)
    (workshop_attended)
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at ?c)
      (not (spent ?c ?d2))
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
      (not (= ?from ?to))
      (not (spent ?to ?d2))
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
    :parameters (?c - city ?d - day)
    :precondition (and
      (current_day ?d)
      (workshop_day ?d)
      (at ?c)
      (spent ?c ?d)
      (not (workshop_attended))
    )
    :effect (and
      (workshop_attended))
  )
)