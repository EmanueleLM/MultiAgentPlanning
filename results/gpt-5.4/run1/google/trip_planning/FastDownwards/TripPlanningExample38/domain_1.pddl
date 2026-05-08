(define (domain trip_planning_example38)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city day
  )

  (:predicates
    (at ?d - day ?c - city)
    (next ?d1 - day ?d2 - day)
    (direct ?from - city ?to - city)
    (visited ?c - city)
  )

  (:action stay
    :parameters (?d1 - day ?d2 - day ?c - city)
    :precondition (and
      (at ?d1 ?c)
      (next ?d1 ?d2)
      (not (at ?d2 ?c))
    )
    :effect (and
      (at ?d2 ?c)
      (visited ?c)
    )
  )

  (:action fly
    :parameters (?d1 - day ?d2 - day ?from - city ?to - city)
    :precondition (and
      (at ?d1 ?from)
      (next ?d1 ?d2)
      (direct ?from ?to)
      (not (at ?d2 ?to))
      (not (= ?from ?to))
    )
    :effect (and
      (at ?d2 ?to)
      (visited ?to)
    )
  )
)