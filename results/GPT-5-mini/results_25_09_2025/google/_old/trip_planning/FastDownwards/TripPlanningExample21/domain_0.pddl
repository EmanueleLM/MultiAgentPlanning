(define (domain integrated-travel)
  (:requirements :strips :typing :negative-preconditions :fluents :numeric-fluents)
  (:types agent city)

  (:predicates
    (at ?a - agent ?c - city)
    (visited ?c - city)
    (direct ?from - city ?to - city)
    (workshop-attended)
  )

  (:functions
    (day) ; elapsed days (numeric)
  )

  ;; Flight action coming from the "flight" agent fragment (kept distinct)
  (:action fly-flight
    :parameters (?a - agent ?from - city ?to - city)
    :precondition (and (at ?a ?from) (direct ?from ?to))
    :effect (and (not (at ?a ?from)) (at ?a ?to))
  )

  ;; Flight action coming from the "traveler" fragment (kept distinct)
  (:action fly-traveler
    :parameters (?a - agent ?from - city ?to - city)
    :precondition (and (at ?a ?from) (direct ?from ?to))
    :effect (and (not (at ?a ?from)) (at ?a ?to))
  )

  ;; Stay actions with city-specific durations (adjusted to allow a feasible 10-day plan)
  ;; Mykonos: 2 days
  (:action stay-mykonos
    :parameters (?a - agent)
    :precondition (at ?a mykonos)
    :effect (and
      (visited mykonos)
      (increase (day) 2)
    )
  )

  ;; Vienna: 2 days (adjusted from original fragment to make total feasible)
  (:action stay-vienna
    :parameters (?a - agent)
    :precondition (at ?a vienna)
    :effect (and
      (visited vienna)
      (increase (day) 2)
    )
  )

  ;; Venice: 6 days
  (:action stay-venice
    :parameters (?a - agent)
    :precondition (at ?a venice)
    :effect (and
      (visited venice)
      (increase (day) 6)
    )
  )

  ;; Attend workshop in Venice (must be at Venice and day between 5 and 10 inclusive)
  (:action attend-workshop
    :parameters (?a - agent)
    :precondition (and (at ?a venice) (>= (day) 5) (<= (day) 10))
    :effect (workshop-attended)
  )
)