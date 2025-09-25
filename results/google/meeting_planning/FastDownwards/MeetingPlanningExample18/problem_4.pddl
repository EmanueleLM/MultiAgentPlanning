(define (problem meet-betty)
  (:domain multiagent-meet)
  (:objects
    marina richmond - location
  )

  (:init
    (at-traveler marina)
    (= (time) 540)
  )

  (:goal (and
    (met75)
  ))
)