(define (domain meeting-domain)
  (:requirements :strips :durative-actions :fluents :numeric-fluents :timed-initial-literals :negative-preconditions)
  (:types agent location)
  (:predicates
    (at ?a - agent ?l - location)
    (met ?a - agent ?b - agent)
  )
  (:functions
    (meeting-time) ; total minutes spent meeting (to maximize)
  )

  ;; Traveler travel actions (explicit agent-labeled names)
  (:durative-action traveler-travel-rh-to-ggp
    :parameters ()
    :duration (= ?duration 21)
    :condition (and
      (at start (at traveler rh))
    )
    :effect (and
      (at end (not (at traveler rh)))
      (at end (at traveler ggp))
    )
  )

  (:durative-action traveler-travel-ggp-to-rh
    :parameters ()
    :duration (= ?duration 19)
    :condition (and
      (at start (at traveler ggp))
    )
    :effect (and
      (at end (not (at traveler ggp)))
      (at end (at traveler rh))
    )
  )

  ;; Meeting action requires both agents at Golden Gate Park during the whole durative interval.
  ;; Duration is variable but must be at least 90 minutes.
  (:durative-action meet-at-ggp
    :parameters ()
    :duration (>= ?duration 90)
    :condition (and
      (at start (at traveler ggp))
      (at start (at john ggp))
      (over all (at traveler ggp))
      (over all (at john ggp))
    )
    :effect (and
      (at end (met traveler john))
      ;; accumulate meeting-time by the actual duration
      (at end (increase (meeting-time) ?duration))
    )
  )
)