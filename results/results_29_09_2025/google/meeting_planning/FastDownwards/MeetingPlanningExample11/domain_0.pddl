(define (domain meet-visitors)
  ;; Requirements: durative actions, timed initial literals, numeric fluents are used
  (:requirements :durative-actions :typing :negative-preconditions :timed-initial-literals :numeric-fluents)
  (:types person location)

  ;; Predicates:
  ;; (at ?p ?l)  - person ?p is at location ?l
  ;; (met ?p)    - visitor has met person ?p (used to avoid double counting)
  ;; (available ?p) - person ?p is available (used with timed initial literals to model windows)
  (:predicates
    (at ?p - person ?l - location)
    (met ?p - person)
    (available ?p - person)
  )

  ;; Numeric fluent to count how many friends have been met
  (:functions
    (num-met)  ;; integer counter of distinct friends met
  )

  ;; Travel actions are modeled as durative actions with fixed durations equal to the reported travel times.
  ;; Durations are expressed in hours (25 min = 25/60 = 0.4166667 h; 27 min = 0.45 h).
  ;; Travel preconditions require the traveller to be at the origin at action start.
  ;; Effects remove the origin location at start and add the destination at end.

  (:durative-action travel-nobhill-to-sunset
    :parameters (?p - person)
    :duration (= ?duration 0.4166667)  ;; 25 minutes
    :condition (at start (at ?p Nob_Hill))
    :effect (and
              (at start (not (at ?p Nob_Hill)))
              (at end (at ?p Sunset_District))
            )
  )

  (:durative-action travel-sunset-to-nobhill
    :parameters (?p - person)
    :duration (= ?duration 0.45)  ;; 27 minutes
    :condition (at start (at ?p Sunset_District))
    :effect (and
              (at start (not (at ?p Sunset_District)))
              (at end (at ?p Nob_Hill))
            )
  )

  ;; Meeting action with Carol.
  ;; - Must be co-located at Sunset_District at start.
  ;; - Requires Carol to be available during the entire meeting (modeled with timed initial literals).
  ;; - Meeting duration is constrained to be at least the minimum (75 minutes = 1.25 h).
  ;; - On completion the meeting marks the friend as met and increases the numeric counter.
  (:durative-action meet-with-carol
    :parameters (?v - person ?c - person)
    ;; require meeting duration >= 1.25 hours (75 minutes)
    :duration (>= ?duration 1.25)
    :condition (and
                 (at start (at ?v Sunset_District))
                 (at start (at ?c Sunset_District))
                 ;; Carol must remain at Sunset and available during the whole meeting
                 (over all (at ?c Sunset_District))
                 (over all (available ?c))
                 (at start (not (met ?c)))  ;; avoid double counting
               )
    :effect (and
              (at end (met ?c))
              (at end (increase (num-met) 1))
            )
  )

)