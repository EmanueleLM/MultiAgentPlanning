(define (problem meeting_planning_example_19_problem)
  (:domain meeting_planning_example_19)
  (:objects
    golden_gate_park pacific_heights - location
    john - person
    t0900 t0916 t1945 t2030 - time
  )
  (:init
    (at_location golden_gate_park)
    (current_time t0900)
    
    ;; Travel from Golden Gate Park to Pacific Heights takes 16 minutes
    ;; Arriving at 9:00 AM means arriving at Pacific Heights at 9:16 AM
    (travel_possible golden_gate_park pacific_heights t0900 t0916)
    
    ;; Wait at Pacific Heights until John is available at 7:45 PM (19:45)
    (wait_possible t0916 t1945)
    
    ;; John is at Pacific Heights from 7:45 PM (19:45) to 8:45 PM (20:45)
    ;; A meeting of 45 minutes starting at 7:45 PM ends at 8:30 PM (20:30)
    ;; 8:30 PM is within John's availability window.
    (meeting_possible john pacific_heights t1945 t2030)
  )
  (:goal
    (has_met john)
  )
)