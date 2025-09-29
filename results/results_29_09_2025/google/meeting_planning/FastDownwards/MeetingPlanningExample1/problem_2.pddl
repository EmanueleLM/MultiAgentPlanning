(define (problem meet-betty-earliest)
  (:domain multiagent-meeting)
  (:objects
    you betty - agent
    richmond-district financial-district - location
    t540 t562 t1013 t1035 t1095 t1305 - time
  )
  (:init
    (at-time you richmond-district t540)
    (at-time betty financial-district t1035)
    (available betty t1035)
    (available betty t1095)
    (travel-time-rf-22)
    (meeting-duration-60)
  )
  (:goal (and
    (met you betty)
  ))
)