(define (domain trip-planning)
  (:requirements :strips :typing :negative-preconditions :fluents)
  (:types city)

  (:predicates
    (at ?loc - city)
    (direct ?from - city ?to - city)
  )

  (:functions
    (used-days)                ; total days consumed so far
    (days-in ?loc - city)      ; accumulated days spent in a specific city
    (min-days ?loc - city)     ; required minimum days to spend in a city (from agents' hard preferences)
  )

  ;; stay in a city for one day (increments both total and city-specific counters)
  (:action stay
    :parameters (?c - city)
    :precondition (and
      (at ?c)
      (< (used-days) 12)            ; cannot stay if no budget left (ensures budget <= 12)
    )
    :effect (and
      (increase (used-days) 1)
      (increase (days-in ?c) 1)
    )
  )

  ;; fly directly from one city to another; allowed only when a direct flight is available,
  ;; and only if the minimum required stay in the current city has already been satisfied.
  (:action fly
    :parameters (?from - city ?to - city)
    :precondition (and
      (at ?from)
      (direct ?from ?to)
      (>= (days-in ?from) (min-days ?from))  ; enforce agent hard preferences before departing
    )
    :effect (and
      (not (at ?from))
      (at ?to)
    )
  )
)