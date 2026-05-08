(define (problem meeting_planning_example_30)
  (:domain meeting_planning)
  (:objects
    me stephanie - person
    richmond_district north_beach - location
    t_0900 t_0917 t_0930 t_1130 - time
  )
  (:init
    (at me richmond_district)
    (at stephanie north_beach)
    (current_time t_0900)
    ;; Travel Richmond to North Beach: 17 minutes (9:00 to 9:17)
    (travel_possible richmond_district north_beach t_0900 t_0917)
    ;; Wait at North Beach until Stephanie arrives: 9:17 to 9:30
    (wait_possible north_beach t_0917 t_0930)
    ;; Meeting Stephanie at North Beach for 120 minutes: 9:30 to 11:30
    ;; This is within Stephanie's window of 9:30 AM to 4:15 PM.
    (meet_possible stephanie north_beach t_0930 t_1130)
  )
  (:goal (met stephanie))
)