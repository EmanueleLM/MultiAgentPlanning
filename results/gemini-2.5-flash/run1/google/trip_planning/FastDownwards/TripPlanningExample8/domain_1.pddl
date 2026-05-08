(define (domain trip-planning)
  (:requirements :typing :negative-preconditions :action-costs)
  (:types city)
  (:predicates
    (at ?c - city)
    (connected ?c1 ?c2 - city)
  )
  (:functions
    (krakow-stay-days)
    (athens-stay-days)
    (zurich-stay-days)
    (current-day) ; Tracks the current day of the trip, starting from 1.
    (total-trip-cost) ; Metric to minimize, represents total days elapsed.
  )

  (:action fly
    :parameters (?from ?to - city)
    :precondition (and
      (at ?from)
      (connected ?from ?to)
      (not (= ?from ?to)) ; Cannot fly to the same city
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (increase (current-day) 1) ; Travel takes one day
      (increase (total-trip-cost) 1)
    )
  )

  (:action stay-krakow
    :parameters ()
    :precondition (and
      (at krakow)
      (< (krakow-stay-days) 6)
    )
    :effect (and
      (increase (krakow-stay-days) 1)
      (increase (current-day) 1) ; Staying takes one day
      (increase (total-trip-cost) 1)
    )
  )

  (:action stay-athens
    :parameters ()
    :precondition (and
      (at athens)
      (< (athens-stay-days) 7)
      (>= (current-day) 1) ; Athens stay must occur between Day 1 and Day 7 (inclusive)
      (<= (current-day) 7)
    )
    :effect (and
      (increase (athens-stay-days) 1)
      (increase (current-day) 1) ; Staying takes one day
      (increase (total-trip-cost) 1)
    )
  )

  (:action stay-zurich
    :parameters ()
    :precondition (and
      (at zurich)
      (< (zurich-stay-days) 5)
    )
    :effect (and
      (increase (zurich-stay-days) 1)
      (increase (current-day) 1) ; Staying takes one day
      (increase (total-trip-cost) 1)
    )
  )
)