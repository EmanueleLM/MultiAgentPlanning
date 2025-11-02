(define (problem trip-orchestration-problem)
  (:domain trip-orchestration)
  (:objects
    traveler-agent flights-agent - agent
    brussels valencia nice - city
  )

  (:init
    (traveler-agent traveler-agent)
    (flights-agent flights-agent)

    (at traveler-agent brussels)

    (direct brussels valencia)
    (direct valencia brussels)
    (direct brussels nice)
    (direct nice brussels)

    (day-0)
    (remaining-9)

    (need-brussels-2)
    (need-valencia-3)
    (need-nice-6)

    (= (total-cost) 0)
  )

  (:goal
    (and
      (need-brussels-0)
      (need-valencia-0)
      (need-nice-0)
      (remaining-0)
      (met-friends)
    )
  )

  (:metric minimize (total-cost))
)