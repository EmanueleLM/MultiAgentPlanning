(define (domain trip_planning_example14)
  (:requirements :strips :typing :negative-preconditions)

  (:types city day)

  (:predicates
    (at ?c - city ?d - day)
    (next ?d1 - day ?d2 - day)
    (direct ?from - city ?to - city)
    (visited ?d - day)
    (current ?d - day)
  )

  (:action start_in_city
    :parameters (?c - city)
    :precondition (and
      (current d1)
      (not (visited d1))
    )
    :effect (and
      (visited d1)
      (at ?c d1)
    )
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (current ?d1)
      (next ?d1 ?d2)
      (visited ?d1)
      (at ?c ?d1)
      (not (visited ?d2))
    )
    :effect (and
      (not (current ?d1))
      (current ?d2)
      (visited ?d2)
      (at ?c ?d2)
    )
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (current ?d1)
      (next ?d1 ?d2)
      (visited ?d1)
      (at ?from ?d1)
      (direct ?from ?to)
      (not (visited ?d2))
      (not (at ?to ?d1))
    )
    :effect (and
      (not (current ?d1))
      (current ?d2)
      (visited ?d2)
      (at ?to ?d2)
    )
  )
)