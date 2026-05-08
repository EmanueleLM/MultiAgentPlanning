(define (problem meeting_planning_example_25)
  (:domain meeting_planning)
  (:objects
    golden_gate_park chinatown - location
    t0900 t0923 t1600 t1745 - time
  )

  (:init
    ;; Starting conditions: At GGP at 9:00 AM
    (at_location golden_gate_park)
    (at_time t0900)

    ;; Connectivity and Temporal feasibility:
    ;; Travel from GGP to Chinatown takes 23 minutes.
    (can_travel golden_gate_park chinatown t0900 t0923)

    ;; Waiting from arrival (9:23 AM) until David arrives at Chinatown (4:00 PM).
    (can_wait t0923 t1600)

    ;; David's schedule: At Chinatown from 4:00 PM to 9:45 PM.
    ;; Meeting for 105 minutes (min requirement) from 4:00 PM (t1600) to 5:45 PM (t1745).
    ;; This is feasible as 5:45 PM is before 9:45 PM.
    (can_meet_david chinatown t1600 t1745)
  )

  (:goal
    ;; The primary goal is to meet David for the specified duration.
    (has_met_david)
  )
)