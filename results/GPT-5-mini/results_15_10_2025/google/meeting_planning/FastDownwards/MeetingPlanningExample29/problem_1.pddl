(define (problem meet-nancy-problem)
  (:domain multiagent-meetings)
  (:objects
    traveler nancy - agent
    sunset haight - location
    t540 t555 t1170 t1245 t1305 - time
  )
  (:init
    (at traveler sunset)
    (at-time t540)
  )
  (:goal (and (met nancy)))
)