(define (problem plan-16-day-trip)
  (:domain multiagent-trip)
  (:objects
    traveler_agent flights_agent orchestrator - agent
    porto berlin reykjavik - city
  )

  (:init
    (= (day-index) 0)
    (= (total-days-left) 16)
    (= (porto-req) 7)
    (= (berlin-req) 6)
    (= (reyk-req) 5)

    (at traveler_agent porto)

    (direct porto berlin)
    (direct berlin porto)
    (direct berlin reykjavik)
    (direct reykjavik berlin)

    (is_reykjavik reykjavik)
  )

  (:goal (and
    (= (total-days-left) 0)
    (= (porto-req) 0)
    (= (berlin-req) 0)
    (= (reyk-req) 0)
    (met_friend)
    (= (day-index) 16)
  ))
)