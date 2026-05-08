(define (problem meeting_planning_problem)
  (:domain meeting_planning)
  (:objects
    nob_hill sunset_district - location
    t0900 t0925 t1400 t1515 t2030 - timepoint
    carol - person
  )
  (:init
    ;; Starting state
    (at_loc nob_hill)
    (current_time t0900)

    ;; Travel distance constraints
    ;; Nob Hill to Sunset District: 25 mins (9:00 -> 9:25)
    (can_travel nob_hill sunset_district t0900 t0925)

    ;; Temporal adjacency for waiting
    ;; Wait until Carol arrives at 2:00 PM (14:00)
    (next_tp t0925 t1400)
    ;; Wait until the end of the day window
    (next_tp t1515 t2030)

    ;; Meeting constraints
    ;; Carol is at Sunset District from 2:00 PM (14:00) to 8:30 PM (20:30)
    ;; Minimum meeting duration: 75 minutes.
    ;; 14:00 + 75 mins = 15:15. This is within her window (ends 20:30).
    (can_meet carol sunset_district t1400 t1515)
  )
  (:goal (met carol))
)