(define (domain trip_planning_example49)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (at ?c - city ?d - day)
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (assigned ?c - city ?d - day)
    (travel_day ?d1 - day ?d2 - day)
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?c ?d1)
      (next ?d1 ?d2)
      (not (travel_day ?d1 ?d2))
      (not (assigned ?c ?d2))
    )
    :effect (and
      (at ?c ?d2)
      (assigned ?c ?d2)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?from ?d1)
      (next ?d1 ?d2)
      (travel_day ?d1 ?d2)
      (direct ?from ?to)
      (not (assigned ?to ?d2))
    )
    :effect (and
      (at ?to ?d2)
      (assigned ?to ?d2)
    )
  )
)