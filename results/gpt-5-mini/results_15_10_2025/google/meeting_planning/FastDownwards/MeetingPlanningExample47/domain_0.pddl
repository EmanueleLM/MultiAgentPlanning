(define (domain schedule-meetings)
  (:requirements :typing :durative-actions :negative-preconditions :timed-initial-literals :fluents)
  (:types person location)
  (:predicates
    (at ?p - person ?l - location)
    (paul-available)
    (met-paul)
  )
  (:functions
    (met-count)
  )

  ; Travel from Richmond District to Nob Hill (traveler-specific)
  (:durative-action travel-richmond-to-nobhill
    :parameters (?tr - person)
    :duration (= ?duration 17)
    :condition (and
      (at start (at ?tr richmond-district))
    )
    :effect (and
      (at start (not (at ?tr richmond-district)))
      (at end (at ?tr nob-hill))
    )
  )

  ; Travel from Nob Hill to Richmond District (traveler-specific)
  (:durative-action travel-nobhill-to-richmond
    :parameters (?tr - person)
    :duration (= ?duration 14)
    :condition (and
      (at start (at ?tr nob-hill))
    )
    :effect (and
      (at start (not (at ?tr nob-hill)))
      (at end (at ?tr richmond-district))
    )
  )

  ; Meeting action between traveler and Paul at Nob Hill
  ; Duration is variable but must be at least 15 minutes. Paul's availability is enforced
  ; by the timed initial literal (paul-available) and the over-all condition.
  (:durative-action meet-with-paul
    :parameters (?tr - person)
    :duration (>= ?duration 15)
    :condition (and
      (at start (at ?tr nob-hill))
      (at start (not (met-paul)))      ; cannot meet twice
      (over all (paul-available))      ; Paul must be available throughout the meeting
    )
    :effect (and
      (at end (increase (met-count) 1))
      (at end (met-paul))
    )
  )
)