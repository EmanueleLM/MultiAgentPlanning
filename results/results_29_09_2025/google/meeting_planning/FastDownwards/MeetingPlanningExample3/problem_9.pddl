(define (problem MeetingPlanningExample3)
  (:domain meeting-planning)
  (:objects
    bayview golden_gate_park - location
    t540 t562 t652 - time
  )
  (:init
    (at traveler bayview)
    (at barbara golden_gate_park)
    (now t540)
    (travel-time t540 t562)
    (meeting-span t562 t652)
    (travels bayview golden_gate_park)
    (available barbara t562 t652)
    (= (total-cost) 0)
  )
  (:goal (and
    (met traveler barbara)
  ))
  (:metric minimize (total-cost))
)