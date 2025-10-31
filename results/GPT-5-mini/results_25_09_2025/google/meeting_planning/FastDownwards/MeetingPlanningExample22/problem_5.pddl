(define (problem meet-andrew)
  (:domain meeting-domain)
  (:objects
    visitor andrew - agent
    presidio unionsq - location
    t9_00 t9_22 t11_15 t13_00 t17_15 - moment
  )
  (:init
    (at visitor presidio)
    (current-time t9_00)
  )
  (:goal (met-105))
)