(define (domain trip_planning_example44)
  (:requirements :strips :typing)

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

    (wedding_window ?d - day)
    (wedding_attended)
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?c)
      (current_day ?d1)
      (next ?d1 ?d2)
    )
    :effect (and
      (stay_day ?c ?d1)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?from)
      (current_day ?d1)
      (next ?d1 ?d2)
      (direct ?from ?to)
    )
    :effect (and
      (flight_day ?from ?to ?d1)
      (not (at ?from))
      (at ?to)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action attend_wedding
    :parameters (?d - day)
    :precondition (and
      (at zurich)
      (current_day ?d)
      (wedding_window ?d)
    )
    :effect (and
      (wedding_attended)
    )
  )
)