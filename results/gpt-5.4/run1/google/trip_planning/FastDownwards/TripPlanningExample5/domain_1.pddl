(define (domain trip_planning_example5)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:predicates
    (at ?c - city)
    (direct_flight ?from - city ?to - city)
    (next ?d1 - day ?d2 - day)
    (current ?d - day)
    (visited ?d - day ?c - city)
  )

  (:action start_in_city
    :parameters (?c - city)
    :precondition (and
      (current day_1)
      (not (at oslo))
      (not (at porto))
      (not (at dubrovnik))
    )
    :effect (and
      (at ?c)
      (visited day_1 ?c)
    )
  )

  (:action stay
    :parameters (?d1 - day ?d2 - day ?c - city)
    :precondition (and
      (current ?d1)
      (next ?d1 ?d2)
      (at ?c)
    )
    :effect (and
      (not (current ?d1))
      (current ?d2)
      (visited ?d2 ?c)
    )
  )

  (:action fly
    :parameters (?d1 - day ?d2 - day ?from - city ?to - city)
    :precondition (and
      (current ?d1)
      (next ?d1 ?d2)
      (at ?from)
      (direct_flight ?from ?to)
      (not (at ?to))
    )
    :effect (and
      (not (current ?d1))
      (current ?d2)
      (not (at ?from))
      (at ?to)
      (visited ?d2 ?to)
    )
  )
)