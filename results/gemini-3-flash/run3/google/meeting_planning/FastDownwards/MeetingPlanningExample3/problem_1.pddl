(define (problem meeting_planning_example_3_problem)
  (:domain meeting_planning_example_3)
  (:objects
    bayview golden_gate_park - location
    t_0900 t_0922 t_1052 t_1130 - time
    barbara - person
  )
  (:init
    (at_loc bayview)
    (at_time t_0900)
    
    ;; Travel from Bayview to Golden Gate Park takes 22 minutes.
    ;; Starting at 9:00 AM (t_0900), the traveler arrives at 9:22 AM (t_0922).
    (can_travel bayview golden_gate_park t_0900 t_0922)
    
    ;; Meeting Barbara at Golden Gate Park for a minimum of 90 minutes.
    ;; Barbara is there from 8:00 AM to 11:30 AM.
    ;; A meeting starting at 9:22 AM and ending at 10:52 AM (t_1052) is 90 minutes long
    ;; and falls entirely within Barbara's window of availability.
    (can_meet barbara golden_gate_park t_0922 t_1052)
    
    ;; Additional facts for travel or longer meetings could be listed here, 
    ;; but the shortest successful plan is encoded via these specific transitions.
  )
  (:goal
    (and
      (met barbara)
    )
  )
)