(define (problem meet-betty-earliest)
  (:domain multiagent-meeting)
  (:objects
    you betty - agent
    richmond-district financial-district - location
    t540 t562 t1013 t1035 t1095 t1305 - time
  )
  (:init
    (= (total-cost) 0)
    (at-time you richmond-district t540)
    (at-time betty financial-district t1035)
    (available betty t1035)
    (available betty t1095)
  )
  (:goal (and
    (met you betty)
  ))
  (:metric minimize (total-cost))
)