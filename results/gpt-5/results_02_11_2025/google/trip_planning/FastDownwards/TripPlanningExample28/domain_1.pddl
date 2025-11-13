(define (domain TripPlanningExample28)
  (:requirements :strips :typing :negative-preconditions :fluents)
  (:types city)

  (:predicates
    (at ?c - city)
    (direct ?from - city ?to - city)
    (visited ?c - city)
  )

  (:functions
    (days-total) - number
    (days-in ?c - city) - number
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
      (visited ?to)
    )
  )

  (:action stay-one-day
    :parameters (?c - city)
    :precondition (and
      (at ?c)
    )
    :effect (and
      (increase (days-total) 1)
      (increase (days-in ?c) 1)
      (visited ?c)
    )
  )
)