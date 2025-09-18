(define (domain integrated-trip-planning)
  (:requirements :strips :typing :fluents)
  (:types traveler city)
  (:predicates
    (at ?t - traveler ?c - city)
    (visited ?c - city)
    (direct ?from - city ?to - city)
    (reachable ?from - city ?to - city)
  )
  (:functions
    (days-left)
    (preferred-days ?c - city)
  )

  ;; Agent 1's travel actions (kept distinct)
  ;; Fly on a known direct flight (does not consume days)
  (:action fly-ag1
    :parameters (?tr - traveler ?from - city ?to - city)
    :precondition (and (at ?tr ?from) (direct ?from ?to))
    :effect (and
      (not (at ?tr ?from))
      (at ?tr ?to)
      (visited ?to)
    )
  )

  ;; Stay one day in the current city: consumes one day and marks city visited
  (:action stay-one-day-ag1
    :parameters (?tr - traveler ?c - city)
    :precondition (and (at ?tr ?c) (> (days-left) 0))
    :effect (and
      (decrease (days-left) 1)
      (visited ?c)
    )
  )

  ;; Agent 2's flight-analysis actions (kept distinct)
  ;; Mark a direct flight as reachable (base case)
  (:action add-reachable-direct-ag2
    :parameters (?from - city ?to - city)
    :precondition (direct ?from ?to)
    :effect (reachable ?from ?to)
  )

  ;; Compose reachability: if ?from can reach ?mid and there is a direct flight ?mid->?to,
  ;; then ?from can reach ?to (multi-hop via direct flights only)
  (:action extend-reachable-ag2
    :parameters (?from - city ?mid - city ?to - city)
    :precondition (and (reachable ?from ?mid) (direct ?mid ?to))
    :effect (reachable ?from ?to)
  )

  ;; Integrator / agent2 helper: make direct flights bidirectional when only one direction is known.
  ;; This resolves an ambiguity in the agents' input (direct flights given one-way only).
  ;; Produces a direct flight in the reverse direction so the traveler can return using direct flights only.
  (:action add-reverse-direct-ag2
    :parameters (?from - city ?to - city)
    :precondition (direct ?from ?to)
    :effect (direct ?to ?from)
  )
)