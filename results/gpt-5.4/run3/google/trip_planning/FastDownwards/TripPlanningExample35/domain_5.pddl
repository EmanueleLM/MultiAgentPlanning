(define (domain trip_planning_example35)
  (:requirements :strips :typing :negative-preconditions)

  (:types city day)

  (:predicates
    (connected ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (current_day ?d - day)
    (at ?c - city)
    (visited ?c - city ?d - day)
  )

  (:action stay
    :parameters (?c - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?c)
      (current_day ?d1)
      (next ?d1 ?d2))
    :effect (and
      (current_day ?d2)
      (not (current_day ?d1))
      (visited ?c ?d2))
  )

  (:action fly
    :parameters (?from - city ?to - city ?d1 - day ?d2 - day)
    :precondition (and
      (at ?from)
      (not (at ?to))
      (current_day ?d1)
      (next ?d1 ?d2)
      (connected ?from ?to))
    :effect (and
      (not (at ?from))
      (at ?to)
      (current_day ?d2)
      (not (current_day ?d1))
      (visited ?to ?d2))
  )
)