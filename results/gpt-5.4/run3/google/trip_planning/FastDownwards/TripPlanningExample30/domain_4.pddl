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
    (current_day ?d - day)
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at ?c ?d1)
      (not (at istanbul ?d2))
      (not (at tallinn ?d2))
      (not (at zurich ?d2))
    )
    :effect (and
      (at ?c ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (current_day ?d1)
      (next ?d1 ?d2)
      (at ?from ?d1)
      (direct ?from ?to)
      (not (at istanbul ?d2))
      (not (at tallinn ?d2))
      (not (at zurich ?d2))
    )
    :effect (and
      (at ?to ?d2)
      (not (current_day ?d1))
      (current_day ?d2)
    )
  )
)