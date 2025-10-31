(define (domain scheduling-domain)
  (:requirements :strips :durative-actions :numeric-fluents :negative-preconditions)
  (:predicates
    (at ?agent ?loc)
    (met-kenneth)
  )
  (:functions
    (time)                         ; current time in minutes since midnight
    (total-cost)                   ; aggregated cost to minimize (travel time - meeting benefits)
    (kenneth-met-duration)         ; accumulated meeting time with Kenneth
  )

  ;; Traveler travels from Fisherman's Wharf to Nob Hill (fixed 11 minutes)
  (:durative-action travel-traveler-fw-to-nobhill
    :parameters ()
    :duration (= ?duration 11)
    :condition (and
      (at start (at traveler fishermans-wharf))
    )
    :effect (and
      (at start (not (at traveler fishermans-wharf)))
      (at end (at traveler nob-hill))
      (at end (increase (time) 11))
      (at end (increase (total-cost) 11))
    )
  )

  ;; Traveler travels from Nob Hill to Fisherman's Wharf (fixed 11 minutes)
  (:durative-action travel-traveler-nobhill-to-fw
    :parameters ()
    :duration (= ?duration 11)
    :condition (and
      (at start (at traveler nob-hill))
    )
    :effect (and
      (at start (not (at traveler nob-hill)))
      (at end (at traveler fishermans-wharf))
      (at end (increase (time) 11))
      (at end (increase (total-cost) 11))
    )
  )

  ;; Traveler can wait at current location for arbitrary non-negative duration
  (:durative-action wait-traveler
    :parameters (?loc)
    :duration (>= ?duration 0)
    :condition (and
      (at start (at traveler ?loc))
    )
    :effect (and
      (at start (not (at traveler ?loc)))
      (at end (at traveler ?loc))
      (at end (increase (time) ?duration))
      ;; waiting does not increase total-cost (we do not penalize waiting)
    )
  )

  ;; Meeting between traveler and Kenneth at Nob Hill.
  ;; - Kenneth is physically at Nob Hill (encoded as (at kenneth nob-hill) in initial state).
  ;; - Meeting must start at or after Kenneth's earliest availability (855) and must finish by 1185.
  ;; - Meeting duration must be at least 90 minutes (hard constraint).
  (:durative-action meet-traveler-kenneth
    :parameters ()
    :duration (>= ?duration 90)
    :condition (and
      (at start (at traveler nob-hill))
      (at start (at kenneth nob-hill))
      ;; cannot start before Kenneth's earliest availability
      (at start (>= (time) 855))
      ;; meeting must finish within Kenneth's availability: time + duration <= 1185
      (at start (<= (+ (time) ?duration) 1185))
    )
    :effect (and
      (at end (increase (time) ?duration))
      (at end (increase (kenneth-met-duration) ?duration))
      ;; we reward meeting time by subtracting it from total-cost (so optimizer will prefer longer meetings)
      (at end (increase (total-cost) (* -1 ?duration)))
      (at end (met-kenneth))
    )
  )
)