(define (problem integrated_meeting_problem)
  (:domain integrated_meeting)

  (:objects 
    barbara traveler - person
    bayview golden_gate_park - location
  )

  (:init 
    (at traveler bayview)
    (at barbara golden_gate_park)
    (= (time) 540) ;; Start time at Bayview: 09:00
    (= (meeting_time) 0)
    (= (travel-time bayview golden_gate_park) 22)
    (= (travel-time golden_gate_park bayview) 23)
    (can_meet)
    (can_meet_persons barbara traveler)
  )

  (:goal 
    (and 
      (meeting_planned barbara traveler)
      (>= (meeting_time) 90) ;; Goal: Meet Barbara for at least 90 minutes
    )
  )

  (:metric minimize (time))
)