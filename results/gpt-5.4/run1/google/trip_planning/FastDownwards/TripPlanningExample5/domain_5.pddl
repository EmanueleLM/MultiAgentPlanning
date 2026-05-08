(define (domain trip_planning_example5)
  (:requirements :strips :typing :negative-preconditions)

  (:types
    city
    day
  )

  (:constants
    d1 - day
  )

  (:predicates
    (at ?c - city)
    (direct_flight ?from - city ?to - city)
    (next ?from_day - day ?to_day - day)
    (current ?d - day)
    (visited ?d - day ?c - city)
  )

  (:action start_in_city
    :parameters (?c - city)
    :precondition (and
      (current d1)
      (not (at ?c))
    )
    :effect (and
      (at ?c)
      (visited d1 ?c)
    )
  )

  (:action stay
    :parameters (?from_day - day ?to_day - day ?c - city)
    :precondition (and
      (current ?from_day)
      (next ?from_day ?to_day)
      (at ?c)
      (not (visited ?to_day ?c))
    )
    :effect (and
      (not (current ?from_day))
      (current ?to_day)
      (visited ?to_day ?c)
    )
  )

  (:action fly
    :parameters (?from_day - day ?to_day - day ?from - city ?to - city)
    :precondition (and
      (current ?from_day)
      (next ?from_day ?to_day)
      (at ?from)
      (direct_flight ?from ?to)
      (not (at ?to))
      (not (visited ?to_day ?to))
    )
    :effect (and
      (not (current ?from_day))
      (current ?to_day)
      (not (at ?from))
      (at ?to)
      (visited ?to_day ?to)
    )
  )
)