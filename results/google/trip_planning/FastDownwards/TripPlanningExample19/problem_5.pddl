(define (problem trip-orchestration-problem)
  (:domain trip-orchestration)
  (:objects
    traveler - agent
    brussels valencia nice - city
    d0 d1 d2 d3 d4 d5 d6 d7 d8 d9 - number
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

    (day d0)
    (remaining d9)

    (need brussels d2)
    (need valencia d3)
    (need nice d4)

    (is-nice nice)

    (dec d1 d0) (dec d2 d1) (dec d3 d2) (dec d4 d3) (dec d5 d4) (dec d6 d5) (dec d7 d6) (dec d8 d7) (dec d9 d8)
    (inc d0 d1) (inc d1 d2) (inc d2 d3) (inc d3 d4) (inc d4 d5) (inc d5 d6) (inc d6 d7) (inc d7 d8) (inc d8 d9)

    (meet-window d1) (meet-window d2) (meet-window d3) (meet-window d4) (meet-window d5) (meet-window d6)
  )

  (:goal (and
    (need brussels d0)
    (need valencia d0)
    (need nice d0)
    (remaining d0)
    (met-friends)
  ))
)