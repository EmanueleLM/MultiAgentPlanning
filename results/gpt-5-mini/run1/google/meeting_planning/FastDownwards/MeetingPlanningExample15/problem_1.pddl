(define (problem MeetingPlanningExample15-prob)
  (:domain MeetingPlanningExample15)
  (:objects
    traveler john auditor orchestrator - agent
    russian_hill golden_gate_park - location
    t0 t219 t240 t330 t465 t555 - time
  )
  (:init
    (at traveler russian_hill t0)
    (at john golden_gate_park t240)
    (time-link t0 t219)
    (time-link t219 t240)
    (time-link t240 t330)
    (available-interval t240 t330)
  )
  (:goal (met traveler john))
)