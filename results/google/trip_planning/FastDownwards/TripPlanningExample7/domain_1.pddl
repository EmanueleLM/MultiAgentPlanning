(define (domain trip-planning-fd)
  (:requirements :strips :typing :negative-preconditions :numeric-fluents)
  (:types city)
  (:predicates
    (at ?c - city)
    (direct ?from - city ?to - city)
    (visited ?c - city)
  )
  (:functions
    (days-left)
    (stay-days ?c - city)
    (target-days ?c - city)
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

  (:action stay-one-day
    :parameters (?c - city)
    :precondition (and
      (at ?c)
      (> (days-left) 0)
      (< (stay-days ?c) (target-days ?c))
    )
    :effect (and
      (increase (stay-days ?c) 1)
      (decrease (days-left) 1)
      (visited ?c)
    )
  )
)