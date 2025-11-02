(define (domain trip-planning-domain)
  (:requirements :strips :typing :negative-preconditions :numeric-fluents :action-costs)
  (:types city)

  (:predicates
    (at ?c - city)
    (direct ?from - city ?to - city)
    (visited ?c - city)
    (settled ?c - city)
  )

  (:functions
    (day)
    (shortfall ?c - city)
    (total-cost)
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
      (< (day) 12)
    )
    :effect (and
      (increase (day) 1)
      (visited ?c)
      (when (> (shortfall ?c) 0)
        (decrease (shortfall ?c) 1)
      )
      (when (= (shortfall ?c) 0)
        (increase (total-cost) 1)
      )
    )
  )

  (:action settle-shortfall
    :parameters (?c - city)
    :precondition (and
      (= (day) 12)
      (not (settled ?c))
    )
    :effect (and
      (increase (total-cost) (shortfall ?c))
      (settled ?c)
    )
  )
)