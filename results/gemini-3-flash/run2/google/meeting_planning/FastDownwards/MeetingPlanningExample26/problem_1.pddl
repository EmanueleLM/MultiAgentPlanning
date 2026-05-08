(define (problem meeting_planning_example_26)
  (:domain meeting_planning)
  (:objects
    richmond_district presidio - location
    t_0900 t_0907 t_1315 t_1500 - time
    sarah - person
  )
  (:init
    ;; Starting state: At Richmond District at 9:00 AM
    (at_loc richmond_district)
    (at_time t_0900)

    ;; Connectivity: Travel from Richmond District to Presidio takes 7 minutes
    ;; Arriving at Richmond District at 9:00 AM, travel to Presidio results in arrival at 9:07 AM
    (can_travel richmond_district presidio t_0900 t_0907)

    ;; Waiting: Wait at Presidio from arrival (9:07 AM) until Sarah arrives (1:15 PM / 13:15)
    (can_wait t_0907 t_1315)

    ;; Meeting: Sarah is at Presidio from 1:15 PM to 3:15 PM.
    ;; To meet her for 105 minutes starting at 1:15 PM (t_1315), 
    ;; the meeting concludes at 3:00 PM (t_1500), which is within her window.
    (can_meet sarah presidio t_1315 t_1500)
  )
  (:goal
    (has_met sarah)
  )
)