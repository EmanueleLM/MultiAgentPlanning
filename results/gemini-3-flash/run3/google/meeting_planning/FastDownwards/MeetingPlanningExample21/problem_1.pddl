(define (problem meeting_planning_problem)
  (:domain meeting_planning)
  (:objects
    me margaret - person
    mission_district haight_ashbury - location
    t0900 t0912 t0942 - time
  )
  (:init
    ;; Starting conditions
    (at me mission_district)
    (current_time t0900)
    
    ;; Margaret's location
    (at margaret haight_ashbury)
    
    ;; Defined travel duration: Mission District to Haight-Ashbury takes 12 minutes (9:00 to 9:12)
    (travel_duration mission_district haight_ashbury t0900 t0912)
    
    ;; Defined meeting duration: Meeting Margaret takes 30 minutes (9:12 to 9:42)
    ;; This is within Margaret's availability window of 8:00 AM to 3:45 PM.
    (meet_duration margaret t0912 t0942)
  )
  (:goal
    (and
      (met margaret)
    )
  )
)