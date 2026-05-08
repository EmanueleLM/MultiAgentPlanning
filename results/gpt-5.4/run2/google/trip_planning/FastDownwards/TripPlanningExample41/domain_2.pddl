(define (domain trip_planning_example41)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:constants
    stockholm athens mykonos - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 - day
  )

  (:predicates
    (direct_flight ?from - city ?to - city)
    (next_day ?d1 - day ?d2 - day)
    (current_day ?d - day)
    (at ?c - city)
    (visited ?c - city ?d - day)
    (conf_day_1_done)
    (conf_day_6_done)
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
    )
  )

  (:action mark_conference_day_1
    :parameters ()
    :precondition (and
      (current_day d1)
      (at stockholm)
      (visited stockholm d1)
      (not (conf_day_1_done))
    )
    :effect (conf_day_1_done)
  )

  (:action mark_conference_day_6
    :parameters ()
    :precondition (and
      (current_day d6)
      (at stockholm)
      (visited stockholm d6)
      (not (conf_day_6_done))
    )
    :effect (conf_day_6_done)
  )

  (:action finish
    :parameters ()
    :precondition (and
      (current_day d13)
      (conf_day_1_done)
      (conf_day_6_done)
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