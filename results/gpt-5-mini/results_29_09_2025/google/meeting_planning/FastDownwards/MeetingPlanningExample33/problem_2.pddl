(define (problem meet-sarah-and-friends)
  (:domain multiagent-meetings)
  (:objects
    traveler - agent
    sunset-district union-square - location
  )
  (:init
    (= (current-time) 540)
    (= (total-meetings) 0)
    (at-traveler-sd)
  )
  (:goal (and
    (sarah-met)
  ))
  (:metric minimize (+ (current-time) (* -1000 (total-meetings))))
)