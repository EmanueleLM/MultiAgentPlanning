(define (problem sf-meet-problem-classical)
  (:domain sf-meet-classical)

  (:objects
    traveler andrew - agent
    Presidio UnionSquare - location
    t540 t562 t586 t675 t780 t1035 - timepoint
  )

  (:init
    (at traveler Presidio)
    (at andrew UnionSquare)
    (at-time t540)
    (= (meetings) 0)
  )

  (:goal (and
    (met-andrew)
  ))

  (:metric maximize (meetings))
)