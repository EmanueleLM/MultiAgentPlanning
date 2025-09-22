(define (domain multiagent-trip)
  (:requirements :strips :typing :fluents :negative-preconditions :equality)
  (:types person city)

  ;; Predicates unify the two agents' views:
  (:predicates
    (city ?c - city)
    (direct-flight ?from - city ?to - city)
    (at ?p - person ?c - city)
    (visited ?c - city)
  )

  ;; Numeric fluents from both agents:
  (:functions
    (day)                       ; current day (1..11)
    (days-used)                 ; total days already used (starts at 0)
    (days-spent-berlin)
    (days-spent-frankfurt)
    (days-spent-bucharest)
    (show-days-attended)        ; days the show was attended in Berlin (must be during days 1..7)
  )

  ;; ------------------------
  ;; Actions originating from "traveler-domain" (prefixed traveler-)
  ;; Keep names distinct from flight_network actions.
  ;; ------------------------

  ;; Traveler: generic travel on a direct flight (counts as one day)
  (:action traveler-travel
    :parameters (?p - person ?from - city ?to - city)
    :precondition (and
      (at ?p ?from)
      (direct-flight ?from ?to)
      (<= (days-used) 10)   ; cannot exceed 11 days after this action
      (<= (day) 10)         ; same time bound for the shared day counter
    )
    :effect (and
      (not (at ?p ?from))
      (at ?p ?to)
      (visited ?to)
      (increase (days-used) 1)
      (increase (day) 1)
    )
  )

  ;; Traveler: stay one day in Berlin
  (:action traveler-stay-berlin
    :parameters (?p - person)
    :precondition (and (at ?p berlin) (<= (days-used) 10))
    :effect (and
      (increase (days-used) 1)
      (increase (day) 1)
      (increase (days-spent-berlin) 1)
    )
  )

  ;; Traveler: stay one day in Frankfurt
  (:action traveler-stay-frankfurt
    :parameters (?p - person)
    :precondition (and (at ?p frankfurt) (<= (days-used) 10))
    :effect (and
      (increase (days-used) 1)
      (increase (day) 1)
      (increase (days-spent-frankfurt) 1)
    )
  )

  ;; Traveler: stay one day in Bucharest
  (:action traveler-stay-bucharest
    :parameters (?p - person)
    :precondition (and (at ?p bucharest) (<= (days-used) 10))
    :effect (and
      (increase (days-used) 1)
      (increase (day) 1)
      (increase (days-spent-bucharest) 1)
    )
  )

  ;; Traveler: attend the Berlin show (must occur during days 1..7)
  (:action traveler-attend-show-in-berlin
    :parameters (?p - person)
    :precondition (and (at ?p berlin) (<= (days-used) 6))
    :effect (and
      (increase (days-used) 1)
      (increase (day) 1)
      (increase (days-spent-berlin) 1)
      (increase (show-days-attended) 1)
    )
  )

  ;; ------------------------
  ;; Actions originating from "flight_network" (prefixed network-)
  ;; Keep names distinct from traveler actions.
  ;; ------------------------

  ;; Network: wait one day (useful to span Berlin show period)
  (:action network-wait
    :parameters (?p - person)
    :precondition (<= (day) 10)    ; only wait if we can still finish by day 11
    :effect (and
      (increase (day) 1)
      (increase (days-used) 1)
    )
  )

  ;; Network: generic flight that cannot depart from Berlin (Berlin departures blocked until day 8)
  (:action network-fly
    :parameters (?p - person ?from - city ?to - city)
    :precondition (and
      (at ?p ?from)
      (direct-flight ?from ?to)
      (not (= ?from berlin))    ; cannot use this action to depart from Berlin
      (<= (day) 10)             ; ensure after the flight day <= 11
    )
    :effect (and
      (not (at ?p ?from))
      (at ?p ?to)
      (visited ?to)
      (increase (day) 1)
      (increase (days-used) 1)
    )
  )

  ;; Network: special flight to depart Berlin (only on or after day 8)
  (:action network-fly-from-berlin
    :parameters (?p - person ?to - city)
    :precondition (and
      (at ?p berlin)
      (direct-flight berlin ?to)
      (>= (day) 8)   ; cannot depart Berlin before day 8 because of the show (days 1..7)
      (<= (day) 10)  ; ensure after the flight day <= 11
    )
    :effect (and
      (not (at ?p berlin))
      (at ?p ?to)
      (visited ?to)
      (increase (day) 1)
      (increase (days-used) 1)
    )
  )
)