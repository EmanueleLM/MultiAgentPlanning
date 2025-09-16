(define (problem integrated_meeting_problem)
  (:domain integrated_meeting)

  (:objects 
    barbara traveler - person
    bayview golden_gate_park - location
  )

  (:init 
    (at traveler bayview)
    (at barbara golden_gate_park)
    (= (total-time) 540) ;; Start time at Bayview: 09:00
    (= (meeting-time_so_far) 0)
    (can_meet)
    (can_meet_persons barbara traveler)
  )

  (:goal 
    (and 
      (meeting_planned barbara traveler)
      (>= (meeting-time_so_far) 90) ;; Goal: Meet Barbara for at least 90 minutes
    )
  )

  (:metric minimize (total-time))
)