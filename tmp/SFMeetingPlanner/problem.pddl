(define (problem meet-james)
  (:domain scheduling)
  (:objects
    scheduler - agent
    James     - person
    Marina    Alamo  - location
  )
  (:init
    ;; start at Marina at time 0 (9:00AM)
    (at scheduler Marina)
    (= (current-time) 0)
  )
  (:goal (met James))
)