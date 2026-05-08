(define (domain tripplanningexample24)
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

    (stay_day ?c - city ?d - day)
    (flight_day ?from - city ?to - city ?d - day)

    (workshop_window ?d - day)
    (workshop_attended)
  )

  (:action stay
    :parameters (?c - city ?d - day ?d_next - day)
    :precondition (and
      (at ?c)
      (current_day ?d)
      (next ?d ?d_next)
      (stay_day ?c ?d)
    )
    :effect (and
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
      (stay_day florence ?d)
      (workshop_window ?d)
      (not (workshop_attended))
    )
    :effect (and
      (workshop_attended)
      (not (current_day ?d))
      (current_day ?d_next)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d - day ?d_next - day)
    :precondition (and
      (at ?from)
      (current_day ?d)
      (next ?d ?d_next)
      (direct ?from ?to)
      (flight_day ?from ?to ?d)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current_day ?d))
      (current_day ?d_next)
    )
  )
)