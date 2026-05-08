(define (domain trip_planning_example44)
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
    (visited ?c - city ?d - day)
    (wedding_window ?d - day)
    (wedding_attended)
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?c)
      (current_day ?d1)
      (next ?d1 ?d2)
      (not (visited ?c ?d2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (visited ?c ?d2)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?from)
      (not (at ?to))
      (direct ?from ?to)
      (current_day ?d1)
      (next ?d1 ?d2)
      (not (visited ?to ?d2))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_day ?d1))
      (current_day ?d2)
      (visited ?to ?d2)
    )
  )

  (:action attend_wedding
    :parameters (?d - day)
    :precondition (and
      (at zurich)
      (current_day ?d)
      (wedding_window ?d)
      (not (wedding_attended))
    )
    :effect (wedding_attended)
  )
)