(define (domain TripPlanningExample28)
  (:requirements :strips :typing :negative-preconditions)
  (:types city token)

  (:predicates
    (at ?c - city)
    (direct ?from - city ?to - city)
    (visited ?c - city)
    (token-for ?t - token ?c - city)
    (used ?t - token)
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

  (:action stay-use-token
    :parameters (?c - city ?t - token)
    :precondition (and
      (at ?c)
      (token-for ?t ?c)
      (not (used ?t))
    )
    :effect (and
      (used ?t)
      (visited ?c)
    )
  )
)