(define (domain trip_planning_example30)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (direct ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (at ?c - city ?d - day)
    (current ?d - day)
  )

  (:action stay
    :parameters (?d1 - day ?d2 - day ?c - city)
    :precondition (and
      (current ?d1)
      (next ?d1 ?d2)
      (at ?c ?d1)
      (not (at istanbul ?d2))
      (not (at tallinn ?d2))
      (not (at zurich ?d2))
    )
    :effect (and
      (at ?c ?d2)
      (not (current ?d1))
      (current ?d2)
    )
  )

  (:action fly
    :parameters (?d1 - day ?d2 - day ?from - city ?to - city)
    :precondition (and
      (current ?d1)
      (next ?d1 ?d2)
      (at ?from ?d1)
      (direct ?from ?to)
      (not (at istanbul ?d2))
      (not (at tallinn ?d2))
      (not (at zurich ?d2))
    )
    :effect (and
      (at ?to ?d2)
      (not (current ?d1))
      (current ?d2)
    )
  )
)