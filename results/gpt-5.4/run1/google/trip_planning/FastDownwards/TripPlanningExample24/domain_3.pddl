(define (domain european_trip_13_days_instance)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (at ?c - city)
    (direct ?from - city ?to - city)
    (current_day ?d - day)
    (next ?d1 - day ?d2 - day)

    (visited_on ?c - city ?d - day)

    (workshop_window ?d - day)
    (workshop_attended)
  )

  (:action stay
    :parameters (?c - city ?d - day ?d_next - day)
    :precondition (and
      (at ?c)
      (current_day ?d)
      (next ?d ?d_next)
      (not (visited_on ?c ?d))
    )
    :effect (and
      (visited_on ?c ?d)
      (not (current_day ?d))
      (current_day ?d_next)
    )
  )

  (:action stay_and_attend_workshop
    :parameters (?d - day ?d_next - day)
    :precondition (and
      (at florence)
      (current_day ?d)
      (next ?d ?d_next)
      (workshop_window ?d)
      (not (visited_on florence ?d))
      (not (workshop_attended))
    )
    :effect (and
      (visited_on florence ?d)
      (workshop_attended)
      (not (current_day ?d))
      (current_day ?d_next)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d - day ?d_next - day)
    :precondition (and
      (at ?from)
      (direct ?from ?to)
      (current_day ?d)
      (next ?d ?d_next)
      (not (visited_on ?to ?d))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (visited_on ?to ?d)
      (not (current_day ?d))
      (current_day ?d_next)
    )
  )
)