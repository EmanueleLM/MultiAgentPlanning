(define (problem meeting_planning_example_6)
  (:domain meeting_planning)

  (:objects
    fishermans_wharf nob_hill - location
    t_0900 t_0911 t_1415 t_1545 - timepoint
  )

  (:init
    ;; Starting state: Arriving at Fisherman's Wharf at 9:00 AM
    (at fishermans_wharf)
    (current_time t_0900)

    ;; Connectivity and temporal constraints for travel
    ;; Travel from FW to NH takes 11 minutes (9:00 AM to 9:11 AM)
    (can_travel fishermans_wharf nob_hill t_0900 t_0911)

    ;; Waiting from early arrival until Kenneth is available at 2:15 PM (14:15)
    (next t_0911 t_1415)

    ;; Meeting window: Kenneth is available 2:15 PM - 7:45 PM. 
    ;; A 90-minute meeting can start at 2:15 PM and end at 3:45 PM (15:45).
    (can_meet_kenneth nob_hill t_1415 t_1545)
  )

  (:goal
    (met_kenneth)
  )
)