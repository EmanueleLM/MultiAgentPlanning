(define (problem meeting_problem)
  (:domain meeting_planning)
  (:objects
    kenneth - person
    fishermans_wharf nob_hill - location
    t0900 t1404 t1415 t1545 t1945 - time
  )
  (:init
    ;; Arrival at Fisherman's Wharf at 9:00 AM
    (at_me fishermans_wharf)
    (time_at t0900)

    ;; Timeline succession
    (next t0900 t1404)
    (next t1404 t1415)
    (next t1415 t1545)
    (next t1545 t1945)

    ;; Travel constraint: Fisherman's Wharf to Nob Hill takes 11 minutes
    ;; Leaving at 14:04 (2:04 PM) to arrive at 14:15 (2:15 PM)
    (can_travel fishermans_wharf nob_hill t1404 t1415)

    ;; Kenneth is at Nob Hill from 2:15 PM (t1415) to 7:45 PM (t1945)
    (at_person kenneth nob_hill t1415)
    (at_person kenneth nob_hill t1545)
    (at_person kenneth nob_hill t1945)

    ;; Meeting requirement: Minimum of 90 minutes
    ;; 14:15 to 15:45 is exactly 90 minutes
    (is_90_min_gap t1415 t1545)
    (is_90_min_gap t1415 t1945)
  )
  (:goal
    (and (has_met kenneth))
  )
)