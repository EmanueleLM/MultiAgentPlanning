(define (domain tripplanningexample1)
  (:requirements :typing :negative-preconditions)
  (:types city)
  (:predicates
    (at ?c - city)
    (direct ?from - city ?to - city)
  )
  (:functions
    (days-remaining)
    (need ?c - city)
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
    :parameters (?c - city)
    :precondition (and
      (at ?c)
      (> (days-remaining) 0)
      (> (need ?c) 0)
    )
    :effect (and
      (decrease (days-remaining) 1)
      (decrease (need ?c) 1)
    )
  )
)