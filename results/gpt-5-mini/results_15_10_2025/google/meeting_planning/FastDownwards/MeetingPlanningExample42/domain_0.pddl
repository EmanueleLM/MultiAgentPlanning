(define (domain traveler-timothy-meeting)
  (:requirements :strips :typing :durative-actions :numeric-fluents :negative-preconditions)
  (:types agent location)
  (:predicates
    (at ?a - agent ?l - location)
    (timothy-at ?l - location)
    (met-with-timothy)
  )
  (:functions
    (clock)        ; absolute time in minutes from midnight
    (meetings)     ; count of completed meetings
  )

  ;; Traveler actions (distinct agent actions)
  (:durative-action travel-nob-to-presidio
    :parameters ()
    :duration (= ?dur 30)                ; travel duration 30 minutes
    :condition (and
                 (at start (at traveler nob_hill))
                )
    :effect (and
             (at start (not (at traveler nob_hill)))
             (at end (at traveler presidio))
             (at end (increase (clock) ?dur))
            )
  )

  (:durative-action travel-presidio-to-nob
    :parameters ()
    :duration (= ?dur 30)
    :condition (and
                 (at start (at traveler presidio))
                )
    :effect (and
             (at start (not (at traveler presidio)))
             (at end (at traveler nob_hill))
             (at end (increase (clock) ?dur))
            )
  )

  ;; Traveler can wait at current location for a flexible discrete duration.
  (:durative-action wait
    :parameters (?d - number)
    :duration (>= ?d 1)
    :condition (and
                 (at start (or (at traveler nob_hill) (at traveler presidio)))
                )
    :effect (and
             (at end (increase (clock) ?d))
            )
  )

  ;; Meeting action (traveler-specific). Must start when Timothy is present window [780,1140]
  ;; Meeting must last at least 30 minutes and must finish by 1140 (19:00).
  (:durative-action meet-with-timothy
    :parameters (?d - number)
    :duration (>= ?d 30)  ;; meeting duration at least 30 minutes
    :condition (and
                 (at start (at traveler presidio))
                 (at start (timothy-at presidio))                      ; Timothy must be marked present at Presidio
                 (at start (>= (clock) 780))                           ; cannot start before 13:00 (780)
                 (at start (<= (+ (clock) ?d) 1140))                  ; must end by 19:00 (1140)
                )
    :effect (and
             (at end (increase (meetings) 1))
             (at end (increase (clock) ?d))
             (at end (met-with-timothy))
            )
  )

  ;; Timothy actions (distinct from traveler actions).
  ;; These actions mark Timothy present at Presidio; they are constrained by clock so the planner
  ;; must apply the start action at or after 13:00 and may apply the end action at/after 19:00.
  (:durative-action timothy-start-shift
    :parameters ()
    :duration (= ?d 0)
    :condition (and
                 (at start (>= (clock) 780))   ; cannot become present before 13:00
                )
    :effect (and
             (at end (timothy-at presidio))
            )
  )

  (:durative-action timothy-end-shift
    :parameters ()
    :duration (= ?d 0)
    :condition (and
                 (at start (>= (clock) 1140))  ; end shift at/after 19:00
                )
    :effect (and
             (at end (not (timothy-at presidio)))
            )
  )

)