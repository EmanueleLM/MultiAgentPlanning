(define (domain tripplanningexample1)
  (:requirements :strips :typing :negative-preconditions)
  (:types city day unit)
  (:predicates
    (at ?c - city)
    (direct ?from - city ?to - city)
    (curr-day ?d - day)
    (dec ?from - day ?to - day)
    (for ?u - unit ?c - city)
    (remaining ?u - unit)
    (spent ?u - unit)
  )

  (:action fly
    :parameters (?from - city ?to - city)
    :precondition (and
      (at ?from)
      (direct ?from ?to)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
    )
  )

  (:action stay
    :parameters (?c - city ?u - unit ?df - day ?dt - day)
    :precondition (and
      (at ?c)
      (for ?u ?c)
      (remaining ?u)
      (curr-day ?df)
      (dec ?df ?dt)
    )
    :effect (and
      (not (remaining ?u))
      (spent ?u)
      (not (curr-day ?df))
      (curr-day ?dt)
    )
  )
)