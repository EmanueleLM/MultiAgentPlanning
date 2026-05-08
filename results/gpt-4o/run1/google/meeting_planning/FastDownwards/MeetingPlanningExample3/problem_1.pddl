(define (problem sf_meeting_plan)
  (:domain meeting_schedule)
  
  (:objects
    bayview golden_gate_park - location
    barbara - person
    800 830 900 922 1000 1030 1100 1130 - time
  )
  
  (:init
    (at bayview)
    (at_time 800)
    (time_available golden_gate_park 800 1130)
    (meeting_possible barbara golden_gate_park)
  )

  (:goal
    (and
      (met barbara)
      (at bayview)
    )
  )
)