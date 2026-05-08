(define (problem sf_meeting_plan)
  (:domain meeting_schedule)

  (:objects
    bayview golden_gate_park - location
    barbara - person
    900 922 930 1000 1100 1123 - time
  )

  (:init
    (current_location bayview)
    (at_time 900)
    (time_available 800 1130)
    (meeting_possible barbara golden_gate_park)
    (next_time 900 922)
    (next_time 922 930)
    (next_time 930 1000)
    (next_time 1000 1100)
  )

  (:goal
    (and
      (met barbara)
      (current_location bayview)
    )
  )
)