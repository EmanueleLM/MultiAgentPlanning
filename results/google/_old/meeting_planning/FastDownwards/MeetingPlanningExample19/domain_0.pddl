(define (domain combined-meet-scheduling)
  (:requirements :typing :durative-actions :negative-preconditions :fluents)
  (:types person location)

  (:predicates
    (at ?p - person ?l - location)
    (met ?a - person ?b - person)
    (available-for-meeting)
  )

  (:functions
    (time) ; global clock in minutes since midnight
    (travel-time ?from - location ?to - location)
    (person-available-start ?p - person)
    (person-available-end ?p - person)
  )

  ;; Visitor-specific travel (kept distinct from John's travel action)
  (:durative-action travel-visitor
    :parameters (?from ?to - location)
    :duration (= ?duration (travel-time ?from ?to))
    :condition (at start (at visitor ?from))
    :effect (and
      (at start (not (at visitor ?from)))
      (at end (at visitor ?to))
      (at end (increase (time) ?duration))
    )
  )

  ;; John-specific travel (kept distinct)
  (:durative-action travel-john
    :parameters (?from ?to - location)
    :duration (= ?duration (travel-time ?from ?to))
    :condition (at start (at john ?from))
    :effect (and
      (at start (not (at john ?from)))
      (at end (at john ?to))
      (at end (increase (time) ?duration))
    )
  )

  ;; Visitor can wait (advance global time) while remaining at a location
  (:durative-action wait-visitor
    :parameters (?loc - location)
    :duration (>= ?duration 0)
    :condition (at start (at visitor ?loc))
    :effect (at end (increase (time) ?duration))
  )

  ;; John can wait (advance global time) while remaining at a location
  (:durative-action wait-john
    :parameters (?loc - location)
    :duration (>= ?duration 0)
    :condition (at start (at john ?loc))
    :effect (at end (increase (time) ?duration))
  )

  ;; Visitor's meeting action: visitor participates in a 45-minute meeting with John.
  ;; Requires both to be at Pacific Heights at start and start within John's meeting-start window [1185,1200]
  (:durative-action visitor-meet-john
    :duration (= ?duration 45)
    :condition (and
      (at start (at visitor pacific-heights))
      (at start (at john pacific-heights))
      (at start (>= (time) 1185))
      (at start (<= (time) 1200))
    )
    :effect (and
      ;; Mark meeting at end (visitor side)
      (at end (met visitor john))
      (at end (increase (time) ?duration))
    )
  )

  ;; John's availability action: John commits to being available for a 45-minute meeting.
  ;; This ensures the meeting interval fits within John's known presence window.
  (:durative-action john-be-available
    :duration (= ?duration 45)
    :condition (and
      (at start (at john pacific-heights))
      ;; John's availability window start/end (numeric)
      (at start (>= (time) (person-available-start john)))
      ;; ensure end of the 45-min interval is within John's available-end
      (at start (<= (+ (time) ?duration) (person-available-end john)))
    )
    :effect (and
      (at end (available-for-meeting))
      (at end (increase (time) ?duration))
    )
  )
)