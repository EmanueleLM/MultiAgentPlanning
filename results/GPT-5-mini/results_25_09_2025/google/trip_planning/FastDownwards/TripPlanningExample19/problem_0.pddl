(define (problem trip-orchestration-problem)
  (:domain trip-orchestration)
  (:objects
    traveler-agent flights-agent - agent
    brussels valencia nice - city
  )

  (:init
    ;; agent identity markers
    (traveler-agent traveler-agent)
    (flights-agent flights-agent)

    ;; initial location assumption: traveler starts in Brussels (chosen from available cities)
    ;; NOTE: starting location was not specified in the inputs; we set it to Brussels here.
    (at traveler-agent brussels)

    ;; direct-flight connectivity known by flights_info (public/shared info)
    (direct brussels valencia)
    (direct valencia brussels)
    (direct brussels nice)
    (direct nice brussels)

    ;; flight-available facts are not set initially; flights_info-provide must be used
    ;; Numeric initializations
    (= (current-day) 0)
    (= (remaining-days) 9)   ; public total trip duration
    (= (need-brussels) 2)    ; traveler private requirement
    (= (need-valencia) 3)
    (= (need-nice) 6)
  )

  (:goal
    (and
      (= (need-brussels) 0)
      (= (need-valencia) 0)
      (= (need-nice) 0)
      (= (remaining-days) 0)
      (met-friends)
    )
  )
)