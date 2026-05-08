(define (domain trip_planning_example41)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (direct_flight ?from - city ?to - city)
    (next_day ?d1 - day ?d2 - day)

    (current_day ?d - day)
    (at ?c - city)

    (visited ?c - city ?d - day)

    (conf_day_1)
    (conf_day_6)

    (done)
  )

  (:action stay
    :parameters (?d1 - day ?d2 - day ?c - city)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at ?c)
      (not (visited ?c ?d2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (visited ?c ?d2)
      (conf_day_1)
    )
  )

  (:action fly
    :parameters (?d1 - day ?d2 - day ?from - city ?to - city)
    :precondition (and
      (current_day ?d1)
      (next_day ?d1 ?d2)
      (at ?from)
      (direct_flight ?from ?to)
      (not (visited ?to ?d2))
    )
    :effect (and
      (not (current_day ?d1))
      (current_day ?d2)
      (not (at ?from))
      (at ?to)
      (visited ?to ?d2)
      (conf_day_1)
    )
  )

  (:action mark_conference_day_1
    :parameters ()
    :precondition (and
      (current_day d1)
      (at stockholm)
      (not (conf_day_1))
    )
    :effect (conf_day_1)
  )

  (:action mark_conference_day_6
    :parameters ()
    :precondition (and
      (current_day d6)
      (at stockholm)
      (not (conf_day_6))
    )
    :effect (conf_day_6)
  )

  (:action finish
    :parameters ()
    :precondition (and
      (current_day d13)
      (conf_day_1)
      (conf_day_6)
      (visited stockholm d1)
      (visited stockholm d2)
      (visited stockholm d3)
      (visited stockholm d4)
      (visited stockholm d5)
      (visited stockholm d6)
      (visited athens d7)
      (visited athens d8)
      (visited athens d9)
      (visited athens d10)
      (visited athens d11)
      (visited mykonos d12)
      (visited mykonos d13)
    )
    :effect (done)
  )
)