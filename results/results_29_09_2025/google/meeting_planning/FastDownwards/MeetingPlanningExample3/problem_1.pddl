(define (problem MeetingPlanningExample3)
  (:domain meeting-planning)
  (:objects
    traveler barbara orchestrator - agent
    bayview golden_gate_park - location
  )
  (:init
    (at traveler bayview)
    (at barbara golden_gate_park)
    (= (time) 540)
  )
  (:goal (and
    (met traveler barbara)
  ))
)