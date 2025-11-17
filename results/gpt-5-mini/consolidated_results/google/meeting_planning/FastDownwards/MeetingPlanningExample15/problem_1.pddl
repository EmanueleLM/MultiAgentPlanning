(define (problem MeetingPlanningExample15-problem)
  (:domain MeetingPlanningExample15)
  (:objects
    traveler - agent
    russian_hill golden_gate_park - location
  )
  (:init
    (at traveler russian_hill)
    (= (time) 0)  ; 09:00 -> time = 0 minutes since 09:00
  )
  ;; Goal: meeting with John achieved (meeting actions enforce >=90 minute requirement and John's availability)
  (:goal (and
    (met-john)
  ))
)