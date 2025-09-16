(define (problem integrated_meeting_problem)
  (:domain integrated_meeting)

  (:objects 
    barbara traveler - person
    bayview golden_gate_park - location
  )

  (:init 
    (at traveler bayview)
    (at barbara golden_gate_park)
    (= (total-time) 540)
    (= (meeting-time_so_far) 0)
    (can_meet)
    (can_meet_persons barbara traveler)
    (= (travel-time) 22)
  )

  (:goal 
    (and 
      (meeting_planned barbara traveler)
      (>= (meeting-time_so_far) 90)
    )
  )

  (:metric minimize (total-time))
)