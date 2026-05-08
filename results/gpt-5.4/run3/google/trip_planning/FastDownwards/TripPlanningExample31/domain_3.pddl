(define (domain european_trip_10_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:constants
    frankfurt reykjavik split - city
  )

  (:predicates
    (at ?c - city)
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (direct_flight ?from - city ?to - city)
    (spent ?c - city ?d - day)
    (workshop_day ?d - day)
    (workshop_attended)
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?c)
      (current_day ?d1)
      (next_day ?d1 ?d2)
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
      (not (at ?to))
      (direct_flight ?from ?to)
      (current_day ?d1)
      (next_day ?d1 ?d2)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action attend_workshop
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (workshop_day ?d)
      (at reykjavik)
      (not (workshop_attended))
    )
    :effect (workshop_attended)
  )
)