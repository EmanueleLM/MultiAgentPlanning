(define (problem meet-andrew)
  (:domain meeting-domain)
  (:objects
    visitor andrew - agent
    presidio unionsq - location
    m540 m562 m675 m780 m1035 - moment
  )
  (:init
    (at visitor presidio)
    (at andrew unionsq)
    (at-time m540)
  )
  (:goal (met-105))
)