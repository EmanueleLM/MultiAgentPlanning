(define (domain meeting-domain)
  (:requirements :typing :durative-actions :fluents :negative-preconditions :equality)
  (:types agent location)
  (:constants traveler john orchestrator - agent rh ggp - location)
  (:predicates
    (at ?a - agent ?l - location)
    (met)
  )
  (:functions
    (current-time) ; minutes since midnight
  )
  (:durative-action traveler-travel-rh-to-ggp
    :parameters ()
    :duration (= ?duration 21)
    :condition (and
      (at start (at traveler rh))
    )
    :effect (and
      (at start (not (at traveler rh)))
      (at end (at traveler ggp))
      (at end (assign (current-time) (+ (current-time) ?duration)))
    )
  )
  (:durative-action traveler-travel-ggp-to-rh
    :parameters ()
    :duration (= ?duration 19)
    :condition (and
      (at start (at traveler ggp))
    )
    :effect (and
      (at start (not (at traveler ggp)))
      (at end (at traveler rh))
      (at end (assign (current-time) (+ (current-time) ?duration)))
    )
  )
  (:durative-action traveler-meet-john
    :parameters ()
    :duration (= ?duration 90)
    :condition (and
      (at start (at traveler ggp))
      ;; meeting must start when John is present (>= 13:00) and finish before John leaves (<= 18:15)
      (at start (>= (current-time) 780))
      (at start (<= (+ (current-time) ?duration) 1095))
    )
    :effect (and
      (at end (met))
      ;; remain at Golden Gate Park after meeting
      (at end (at traveler ggp))
      (at end (assign (current-time) (+ (current-time) ?duration)))
    )
  )
  (:durative-action traveler-wait
    :parameters (?d - number)
    :duration (= ?duration ?d)
    :condition (and
      (at start (at traveler rh))
    )
    :effect (and
      (at end (at traveler rh))
      (at end (assign (current-time) (+ (current-time) ?duration)))
    )
  )
  (:durative-action john-idle
    :parameters ()
    :duration (= ?duration 1)
    :condition (and)
    :effect (and
      (at end (assign (current-time) (+ (current-time) ?duration)))
    )
  )
)