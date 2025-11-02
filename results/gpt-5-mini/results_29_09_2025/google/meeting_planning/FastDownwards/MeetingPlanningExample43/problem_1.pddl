(define (problem meeting-prob-43)
  (:domain meeting-domain)
  (:objects
    traveler sandra - agent
    marina chinatown - location
  )
  (:init
    (at-traveler marina)
    (at-sandra chinatown)
    (= (current-time) 540)
    (= (meetings-achieved) 0)
    (= (total-meeting-time) 0)
  )
  ;; trivial numeric goal so planner is free to optimize the metric
  (:goal (>= (meetings-achieved) 0))
  (:metric maximize (+ (total-meeting-time) (meetings-achieved)))
)