(define (problem trip-orchestration-problem)
  (:domain trip-orchestration)
  (:objects
    traveler - agent
    brussels valencia nice - city
  )

  (:init
    (traveler-agent traveler)

    (at traveler brussels)

    (direct brussels valencia)
    (direct valencia brussels)
    (direct brussels nice)
    (direct nice brussels)

    (flight-available brussels valencia)
    (flight-available valencia brussels)
    (flight-available brussels nice)
    (flight-available nice brussels)

    (= (total-cost) 0)
    (= (remaining) 9)
    (= (day) 0)

    (= (need brussels) 2)
    (= (need valencia) 3)
    (= (need nice) 4)
  )

  (:goal
    (and
      (= (need brussels) 0)
      (= (need valencia) 0)
      (= (need nice) 0)
      (= (remaining) 0)
      (met-friends)
    )
  )

  (:metric minimize (total-cost))
)