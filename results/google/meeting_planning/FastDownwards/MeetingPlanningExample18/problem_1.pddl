(define (problem meet-betty)
  (:domain multiagent-meet)
  (:objects
    marina richmond - location
  )

  (:init
    (at-traveler marina)
    (= (time) 540)
    (= (met-minutes) 0)
  )

  (:goal (and
    (>= (met-minutes) 75)
  ))
  (:metric maximize (met-minutes))
)