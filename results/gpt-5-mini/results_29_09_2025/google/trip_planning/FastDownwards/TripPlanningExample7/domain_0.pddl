(define (domain travel-multiagent)
  ;; Requirements: typing and numeric fluents for day counting and capacities
  (:requirements :strips :typing :fluents :negative-preconditions)

  (:types agent city)

  (:predicates
    (at ?ag - agent ?c - city)       ; agent located in city
    (flight ?from - city ?to - city) ; direct flight connectivity facts (defined in problem)
    (visited ?c - city)              ; city has been visited at least once
  )

  ;; Numeric functions:
  ;; total-days: accumulated days used by the itinerary (flights and stays)
  ;; available-days ?c: remaining available stay-days that may be allocated in city ?c
  (:functions
    (total-days)
    (available-days ?c - city)
  )

  ;; Action: take a direct flight (only permitted when a (flight from to) fact exists in the problem)
  ;; Comments: flights consume 1 day in this model.
  (:action fly
    :parameters (?ag - agent ?from - city ?to - city)
    :precondition (and
      (at ?ag ?from)
      (flight ?from ?to)
    )
    :effect (and
      (not (at ?ag ?from))
      (at ?ag ?to)
      (visited ?to)
      (increase (total-days) 1)
    )
  )

  ;; Action: stay one extra day in the current city
  ;; Requires that the city has at least one available stay-day remaining
  (:action stay
    :parameters (?ag - agent ?c - city)
    :precondition (and
      (at ?ag ?c)
      (>= (available-days ?c) 1)
    )
    :effect (and
      (increase (total-days) 1)
      (decrease (available-days ?c) 1)
      (visited ?c)
    )
  )
)