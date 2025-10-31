(define (domain multi-agent-scheduling)
  (:requirements :durative-actions :typing :negative-preconditions :timed-initial-literals :fluents :numeric-fluents)
  (:types location)
  (:predicates
    (traveler-at ?l - location)
    (traveler-free)
    (jason-available)
    (met-jason)
  )
  (:functions
    (num-met) ; numeric counter of friends met
  )

  ;; Traveler travel from Bayview to Chinatown (18 minutes = 0.3 hours)
  (:durative-action travel-traveler-bayview-to-chinatown
    :parameters ()
    :duration (= ?duration 0.3)
    :condition (and
                 (at start (traveler-at bayview))
                 (at start (traveler-free))
               )
    :effect (and
              (at start (not (traveler-at bayview)))
              (at start (not (traveler-free)))
              (at end (traveler-at chinatown))
              (at end (traveler-free))
            )
  )

  ;; Traveler travel from Chinatown to Bayview (22 minutes = 0.3666667 hours)
  (:durative-action travel-traveler-chinatown-to-bayview
    :parameters ()
    :duration (= ?duration 0.3666667)
    :condition (and
                 (at start (traveler-at chinatown))
                 (at start (traveler-free))
               )
    :effect (and
              (at start (not (traveler-at chinatown)))
              (at start (not (traveler-free)))
              (at end (traveler-at bayview))
              (at end (traveler-free))
            )
  )

  ;; Meeting between Traveler and Jason at a location.
  ;; Meeting duration must be at least 1.5 hours (90 minutes).
  ;; The meeting must occur entirely while Jason is available (over all jason-available).
  (:durative-action meet-traveler-jason
    :parameters (?l - location)
    :duration (>= ?duration 1.5)
    :condition (and
                 (at start (traveler-at ?l))
                 (at start (traveler-free))
                 (over all (jason-available))
               )
    :effect (and
              (at start (not (traveler-free)))
              (at end (traveler-free))
              (at end (met-jason))
              (at end (increase (num-met) 1))
            )
  )
)