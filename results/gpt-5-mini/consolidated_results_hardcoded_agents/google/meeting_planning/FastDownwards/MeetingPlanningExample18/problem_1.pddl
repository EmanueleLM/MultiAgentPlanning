(define (problem MeetingPlanningExample18-problem)
  (:domain MeetingPlanningExample18-domain)
  (:objects
    marina richmond - location
  )
  (:init
    (at marina)
    (= (current-time) 540)        ; 09:00 = 9*60 = 540
    (= (betty-meeting) 0)
    (= (total-cost) 0)
  )
  ; Goal: achieve at least 75 continuous minutes meeting with Betty (the model forces this via a single 75-minute meet action).
  (:goal (and (>= (betty-meeting) 75)))
  ; Metric: prefer plans with less total travel time (total-cost is incremented only by travel actions).
  (:metric minimize (total-cost))
)