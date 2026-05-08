(define (problem meeting_planning_example_39)
  (:domain meeting_planning)
  (:objects
    t0900 t0911 t1645 t1845 t2145 - time_point
  )
  (:init
    (at fishermans_wharf)
    (time t0900)
    ;; Travel from Fisherman's Wharf to Nob Hill takes 11 minutes.
    ;; Starting at 9:00AM (t0900), the earliest arrival at Nob Hill is 9:11AM (t0911).
    (move_time fishermans_wharf nob_hill t0900 t0911)
    ;; Wait at Nob Hill until Stephanie arrives at 4:45PM (t1645).
    (next t0911 t1645)
    ;; Meet Stephanie for 120 minutes: from 4:45PM (t1645) until 6:45PM (t1845).
    (meet_time t1645 t1845)
    ;; Stephanie is available until 9:45PM (t2145).
    (next t1845 t2145)
  )
  (:goal
    (met_stephanie)
  )
)