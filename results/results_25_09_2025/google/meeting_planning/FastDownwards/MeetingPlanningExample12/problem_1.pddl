(define (problem meet-barbara-90min)
  (:domain meet-scheduling)

  (:objects
    north-beach alamo-square - location
    visitor barbara - agent
  )

  (:init
    (time-t540)
    (at-visitor north-beach)
    (= (total-cost) 0)
  )

  (:goal (meeting-done))
)