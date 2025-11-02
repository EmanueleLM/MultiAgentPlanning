(define (domain schedule-orchestration)
  (:requirements :typing :durative-actions :fluents :numeric-fluents :negative-preconditions)
  (:types agent location)
  (:predicates
    (at ?a - agent ?l - location)
  )
  (:functions
    (time)                          ; global discrete time in minutes since midnight
    (meeting-duration-james)        ; accumulated meeting minutes with James
    (total-meetings)                ; number of meetings scheduled (integer)
  )

  ;; Traveler-specific travel actions (durations in minutes are exact discrete integers)
  (:durative-action travel-traveler-ggp-to-marina
    :parameters ()
    :duration (= ?duration 16)
    :condition (and
                 (at start (at traveler golden-gate-park))
                 ;; traveler is at origin at start; invariant forbids being at a different place during travel
                 (over all (not (at traveler marina)))
               )
    :effect (and
             (at start (not (at traveler golden-gate-park)))
             (at end (at traveler marina))
             (at end (increase (time) ?duration))
            )
  )

  (:durative-action travel-traveler-marina-to-ggp
    :parameters ()
    :duration (= ?duration 18)
    :condition (and
                 (at start (at traveler marina))
                 (over all (not (at traveler golden-gate-park)))
               )
    :effect (and
             (at start (not (at traveler marina)))
             (at end (at traveler golden-gate-park))
             (at end (increase (time) ?duration))
            )
  )

  ;; Meeting with James. This action schedules a contiguous meeting block at Marina District.
  ;; It is traveler-initiated; James' presence is represented only by the hard temporal availability constraints.
  (:durative-action meet-with-james
    :parameters ()
    ;; duration variable ?duration constrained below in :condition
    :duration ( ?duration )
    :condition (and
                 ;; traveler must be at Marina for entire contiguous meeting
                 (at start (at traveler marina))
                 (over all (at traveler marina))
                 ;; James' availability window hard constraint: meeting must start no earlier than 10:15 (615)
                 ;; and must finish no later than 13:30 (810).
                 ;; The check below enforces: (time_at_start >= 615) AND (time_at_start + ?duration <= 810)
                 (at start (>= (time) 615))
                 (at start (<= (+ (time) ?duration) 810))
                 ;; minimum meeting duration preference treated as hard constraint:
                 (at start (>= ?duration 15))
               )
    :effect (and
             ;; accumulate meeting duration with James and increment meeting count
             (at end (increase (meeting-duration-james) ?duration))
             (at end (increase (total-meetings) 1))
             ;; advance global time by meeting duration
             (at end (increase (time) ?duration))
            )
  )
)