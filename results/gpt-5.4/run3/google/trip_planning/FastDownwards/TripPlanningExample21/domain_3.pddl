(define (domain european_trip_10_days)
  (:requirements :strips :typing :negative-preconditions)

  (:types city day)

  (:predicates
    (at ?c - city)
    (current_day ?d - day)
    (next ?d1 - day ?d2 - day)
    (direct ?from - city ?to - city)

    (start_day ?d - day)
    (end_day ?d - day)

    (visited_on ?c - city ?d - day)
    (workshop_window ?d - day)
    (workshop_attended)
  )

  (:action start_in_city
    :parameters (?c - city ?d - day)
    :precondition (and
      (start_day ?d)
      (current_day ?d)
      (not (at mykonos))
      (not (at vienna))
      (not (at venice))
    )
    :effect (and
      (at ?c)
      (visited_on ?c ?d)
    )
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?c)
      (current_day ?d1)
      (next ?d1 ?d2)
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (visited_on ?c ?d2)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?from)
      (current_day ?d1)
      (next ?d1 ?d2)
      (direct ?from ?to)
      (not (at ?to))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_day ?d1))
      (current_day ?d2)
      (visited_on ?to ?d2)
    )
  )

  (:action attend_workshop
    :parameters (?d - day)
    :precondition (and
      (current_day ?d)
      (at venice)
      (visited_on venice ?d)
      (workshop_window ?d)
      (not (workshop_attended))
    )
    :effect (workshop_attended)
  )
)