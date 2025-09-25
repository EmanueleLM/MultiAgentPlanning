(define (problem meeting-problem)
  (:domain meeting-domain)
  (:objects
    traveler barbara - agent
    bayview ggp - location
  )
  (:init
    (= (clock) 0)
    (at traveler bayview)
    (at barbara ggp)
  )
  (:goal (met))
  (:metric minimize (clock))
)