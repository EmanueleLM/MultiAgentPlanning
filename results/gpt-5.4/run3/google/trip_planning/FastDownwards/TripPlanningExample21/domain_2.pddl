(define (domain european_trip_10_days)
  (:requirements :strips :typing :negative-preconditions)

  (:types city day)

  (:predicates
    (at ?c - city)
    (current_day ?d - day)
    (next ?d1 - day ?d2 - day)
    (direct ?from - city ?to - city)
    (in_venice_window ?d - day)

    (visited_on ?c - city ?d - day)
    (workshop_attended)
    (finished)
  )

  (:action start_day_1
    :parameters (?c - city)
    :precondition (and
      (current_day d1)
      (not (finished))
      (not (at mykonos))
      (not (at vienna))
      (not (at venice))
    )
    :effect (and
      (at ?c)
      (visited_on ?c d1)
    )
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?c)
      (current_day ?d1)
      (next ?d1 ?d2)
      (visited_on ?c ?d1)
      (not (finished))
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
      (visited_on ?from ?d1)
      (direct ?from ?to)
      (not (finished))
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
      (in_venice_window ?d)
      (not (workshop_attended))
      (not (finished))
    )
    :effect (workshop_attended)
  )

  (:action finish
    :parameters ()
    :precondition (and
      (current_day d10)
      (workshop_attended)
      (not (finished))
    )
    :effect (finished)
  )
)