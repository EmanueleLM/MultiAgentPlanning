; Orchestrated domain merging traveler and flights_info agents
; Notes:
; - Actions from the traveler agent are prefixed with "traveler-..."
; - Actions inspired by the flights_info agent are prefixed with "flightsinfo-..."
; - There is a single time counter (days) as a numeric fluent.
; - Stayed counts per city (stayed ?c) are numeric fluents.
; - Only direct flights are allowed via the (direct ?from ?to) predicate.
; - Meeting friends in Nice must occur while at nice with stayed nice >= 1 and days <= 6.
(define (domain orchestrated_trip)
  (:requirements :strips :typing :negative-preconditions :fluents)
  (:types city)
  (:predicates
    (at ?c - city)
    (direct ?from - city ?to - city)
    (met-friends)
  )
  (:functions
    (days) ; unified trip duration counter
    (stayed ?c - city) ; days stayed in each city
  )

  ; Traveler agent actions (prefixed with traveler-)
  (:action traveler-start-in
    :parameters (?c - city)
    :precondition (and
      (= (days) 0)
    )
    :effect (and
      (at ?c)
      (increase (stayed ?c) 1)
      (increase (days) 1)
    )
  )

  (:action traveler-stay
    :parameters (?c - city)
    :precondition (and
      (at ?c)
      (< (days) 9)
    )
    :effect (and
      (increase (stayed ?c) 1)
      (increase (days) 1)
    )
  )

  (:action traveler-fly
    :parameters (?from - city ?to - city)
    :precondition (and
      (at ?from)
      (direct ?from ?to)
      (< (days) 9)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (increase (stayed ?to) 1) ; arrival day counts as stayed in destination
      (increase (days) 1)
    )
  )

  (:action traveler-meet-in-nice
    :precondition (and
      (at nice)
      (>= (stayed nice) 1)
      (<= (days) 6)
      (not (met-friends))
    )
    :effect (and
      (met-friends)
    )
  )

  ; flights_info agent action (prefixed with flightsinfo-)
  ; This encodes the same direct-flight capability coming from flights_info,
  ; kept as a distinct action to preserve agent-specific actions.
  (:action flightsinfo-fly
    :parameters (?from - city ?to - city)
    :precondition (and
      (at ?from)
      (direct ?from ?to)
      (< (days) 9)
    )
    :effect (and
      (not (at ?from))
      (at ?to)
      (increase (days) 1)
      ; flights_info did not track stayed originally; optionally leave stayed unchanged,
      ; but here we model arrival as a stayed day as well so the traveler and flightsinfo actions
      ; have compatible semantics for arrivals.
      (increase (stayed ?to) 1)
    )
  )
)