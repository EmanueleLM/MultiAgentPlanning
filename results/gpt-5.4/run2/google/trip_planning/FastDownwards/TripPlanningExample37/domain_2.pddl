(define (domain trip_planning_example37)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (at ?c - city)
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (current ?d - day)
    (visited ?c - city ?d - day)
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?c)
      (current ?d1)
      (next ?d1 ?d2)
      (not (visited ?c ?d2))
    )
    :effect (and
      (not (current ?d1))
      (current ?d2)
      (visited ?c ?d2)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?from)
      (current ?d1)
      (next ?d1 ?d2)
      (direct ?from ?to)
      (not (visited ?to ?d2))
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (not (current ?d1))
      (current ?d2)
      (visited ?to ?d2)
    )
  )
)