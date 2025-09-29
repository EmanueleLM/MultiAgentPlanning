(define (domain multi-agent-scheduling)
  ;; Requirements chosen to support durative actions, numeric fluents, and timed initial literals
  (:requirements :strips :typing :durative-actions :negative-preconditions :fluents :numeric-fluents :timed-initial-literals)

  (:types agent person location)

  ;; Predicates for agent and person locations are kept separate to keep agent actions scoped
  (:predicates
    (at-agent ?a - agent ?l - location)
    (at-person ?p - person ?l - location)
    (available ?p - person)
    (met ?p - person)
  )

  (:functions
    (met-count) ; numeric fluent counting how many friends have been met
  )

  ;; Traveler travel actions (distinct, agent-scoped)
  (:durative-action travel_traveler_alamo_to_sunset
    :parameters ()
    :duration (= ?dur 16)
    :condition (at start (at-agent traveler alamo))
    :effect (and
              (at start (not (at-agent traveler alamo)))
              (at end (at-agent traveler sunset))
            )
  )

  (:durative-action travel_traveler_sunset_to_alamo
    :parameters ()
    :duration (= ?dur 17)
    :condition (at start (at-agent traveler sunset))
    :effect (and
              (at start (not (at-agent traveler sunset)))
              (at end (at-agent traveler alamo))
            )
  )

  ;; Meeting action between traveler and Matthew.
  ;; We schedule the minimal required meeting duration (15 minutes). The meeting requires
  ;; both traveler and Matthew to be at Sunset for the entire meeting interval.
  (:durative-action meet_traveler_matthew
    :parameters ()
    ;; The requirement is at least 15 minutes. To keep the model deterministic and compatible
    ;; with many planners, the action is constrained to the minimal acceptable duration of 15.
    ;; (If planners with flexible durations are used, the duration constraint could be relaxed.)
    :duration (= ?dur 15)
    :condition (and
                 (at start (at-agent traveler sunset))
                 (at start (at-person matthew sunset))
                 ;; Matthew must remain available for the whole meeting duration
                 (over all (available matthew))
               )
    :effect (and
              (at end (met matthew))
              (at end (increase (met-count) 1))
            )
  )
)