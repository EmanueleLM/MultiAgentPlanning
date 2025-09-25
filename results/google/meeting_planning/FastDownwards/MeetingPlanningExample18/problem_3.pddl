(define (problem meet-betty)
  (:domain multiagent-meet)
  (:objects
    marina richmond - location
  )

  (:init
    (at-traveler marina)
    (betty-available)
  )

  (:goal (and
    (met75)
  ))
)