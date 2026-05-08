(define (domain trip_planning_example44)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (at ?c - city)
    (direct ?from - city ?to - city)
    (current_day ?d - day)
    (next_day ?d1 - day ?d2 - day)
    (visited_on ?c - city ?d - day)
    (wedding_window ?d - day)
    (wedding_attended)
  )

  (:action stay_day
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?c)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (not (visited_on ?c ?d1))
    )
    :effect (and
      (visited_on ?c ?d1)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action fly_and_stay_day
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?from)
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (direct ?from ?to)
      (not (visited_on ?to ?d1))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (visited_on ?to ?d1)
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
      (not (wedding_attended))
    )
    :effect (wedding_attended)
  )
)