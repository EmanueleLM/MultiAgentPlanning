(define (problem plan-16-day-trip)
  (:domain multiagent-trip)
  (:objects
    traveler_agent - agent
    flights_agent - agent
    porto berlin reykjavik - city
  )

  (:init
    ;; start day 0
    (= (day) 0)

    ;; start location — traveler begins in Porto (traveler's private plan indicates Porto stay)
    (at traveler_agent porto)

    ;; flight connectivity (from flights_agent's information)
    (direct porto berlin)
    (direct berlin porto)
    (direct berlin reykjavik)
    (direct reykjavik berlin)

    ;; no cities visited initially
    ;; met-friend not true initially
  )

  ;; Goals:
  ;; - visit all three cities at least once
  ;; - meet friend in Reykjavik between day 12 and day 16 (meeting action enforces window)
  ;; - finish the trip at day 16
  (:goal (and
    (visited porto)
    (visited berlin)
    (visited reykjavik)
    (met-friend)
    (= (day) 16)
  ))
)