(define (problem meet-james)
  (:domain scheduling)
  (:objects
    scheduler - agent
    james     - person
    marina-district alamo-square - location
  )
  (:init
    (at-agent   scheduler marina-district)
    (at-person  james     alamo-square)
    (= (current-time) 0)
  )
  (:goal (met james))
)