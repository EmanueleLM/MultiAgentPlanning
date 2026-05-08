(define (domain meeting-scheduler-temporal)
  (:requirements :strips :typing :durative-actions :fluents :negative-preconditions :action-costs)
  (:types
    location
    friend
  )

  (:predicates
    (at ?l - location)
    (john-meeting-completed)
  )

  (:functions
    (current-time) ; Tracks absolute time in minutes (relative to midnight 0:00)
    (john-met-duration) ; Tracks duration met with John
  )

  (:constants
    bayview - location
    russian-hill - location
    john - friend
  )

  ; Hard constraints:
  ; Start Time: 540 (9:00 AM)
  ; Critical Departure Time: 1027 (4:07 PM)
  ; John Availability Start: 1050 (5:30 PM)
  ; John Availability End: 1260 (9:00 PM)
  ; Minimum Meeting Duration: 75

  ; 1. Wait/Idle Action: Covers the flexible time available at Bayview.
  ; The planner must choose duration ?d=487 to allow the travel action to start exactly at 1027, driven by the minimization metric and subsequent preconditions.
  (:durative-action wait-at-bayview
    :parameters ()
    :duration (?d)
    :condition (and
      (at start (at bayview))
      (at start (= (current-time) 540))
      (at end (<= (+ (current-time) ?d) 1027)) ; Cannot wait past the critical departure time
    )
    :effect (and
      (at end (increase (current-time) ?d))
    )
  )

  ; 2. Travel Action: Fixed 23 minutes. Must start exactly at 1027 to arrive exactly at 1050.
  (:durative-action travel-bayview-to-russianhill
    :parameters ()
    :duration (= ?d 23)
    :condition (and
      (at start (at bayview))
      (at start (= (current-time) 1027)) 
    )
    :effect (and
      (at start (not (at bayview)))
      (at end (at russian-hill))
      (at end (increase (current-time) ?d)) ; Time becomes 1050
    )
  )

  ; 3. Meet John Action: Variable duration (75 to 210 minutes), bounded by John's availability.
  ; The metric will drive ?d to be exactly 75 minutes (ending at 1125).
  (:durative-action meet-john
    :parameters ()
    :duration (?d)
    :condition (and
      (at start (at russian-hill))
      (at start (>= (current-time) 1050)) 
      (at end (<= (+ (current-time) ?d) 1260))
      (over all (at russian-hill))
      (at end (>= ?d 75)) ; Minimum duration requirement (75 minutes)
    )
    :effect (and
      (at end (increase (current-time) ?d))
      (at end (increase (john-met-duration) ?d))
      (at end (john-meeting-completed))
    )
  )
)