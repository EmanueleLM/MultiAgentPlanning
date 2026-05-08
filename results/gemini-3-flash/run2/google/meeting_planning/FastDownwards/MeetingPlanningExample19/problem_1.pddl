(define (problem meeting_planning_example_19)
  (:domain meeting_planning)
  (:objects
    golden_gate_park pacific_heights - location
    t0900 t0916 t1945 t2030 - time
    john - person
  )
  (:init
    (at golden_gate_park)
    (time_at t0900)
    
    ;; Travel from Golden Gate Park to Pacific Heights takes 16 minutes.
    ;; Starting at 9:00 AM, arrival is at 9:16 AM.
    (can_travel golden_gate_park pacific_heights t0900 t0916)
    
    ;; Wait from arrival at 9:16 AM until John arrives at 7:45 PM (19:45).
    (can_wait t0916 t1945)
    
    ;; John is at Pacific Heights from 7:45 PM to 8:45 PM.
    ;; A meeting of 45 minutes can occur from 7:45 PM (t1945) to 8:30 PM (t2030).
    (can_meet john pacific_heights t1945 t2030)
  )
  (:goal
    (and
      (met john)
    )
  )
)