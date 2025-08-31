(define (domain meet-orchestrated)
  (:requirements :strips :durative-actions :typing :negative-preconditions :timed-initial-literals)
  (:types person location)

  (:predicates
    (at ?p - person ?l - location)
    (met ?a - person ?b - person)
  )

  ;; Traveler-specific travel action (distinct name)
  (:durative-action travel_traveler
    :parameters (?p - person ?from - location ?to - location)
    :duration (= ?duration 15)
    :condition (and
      (at start (at ?p ?from))
    )
    :effect (and
      (at end (not (at ?p ?from)))
      (at end (at ?p ?to))
    )
  )

  ;; James-specific travel action (distinct name). Kept separate so agent actions remain distinct.
  (:durative-action travel_james
    :parameters (?p - person ?from - location ?to - location)
    :duration (= ?duration 15)
    :condition (and
      (at start (at ?p ?from))
    )
    :effect (and
      (at end (not (at ?p ?from)))
      (at end (at ?p ?to))
    )
  )

  ;; 75-minute meeting requiring both agents to be co-located for the whole duration.
  ;; The meeting can only be scheduled if James is present during the entire 75 minutes
  ;; (James' presence window is provided in the problem via timed initial literals).
  (:durative-action meet_75
    :parameters (?trav - person ?j - person ?l - location)
    :duration (= ?duration 75)
    :condition (and
      (at start (at ?trav ?l))
      (at start (at ?j ?l))
      (over all (at ?trav ?l))
      (over all (at ?j ?l))
    )
    :effect (at end (met ?trav ?j))
  )
)