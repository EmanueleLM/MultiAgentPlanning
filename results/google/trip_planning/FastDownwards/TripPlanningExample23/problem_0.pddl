(define (problem multi-trip-problem)
  (:domain multi-agent-trip)
  (:objects
    agent1 agent2 - agent
    london bucharest riga - city
  )

  (:init
    ;; Start day
    (= (day) 1)

    ;; Initial locations
    (at agent1 london)
    (at agent2 london)                ;; agent2 present but not required to achieve the specified itinerary

    ;; Mark the start city as visited for agent1
    (visited agent1 london)

    ;; Zeroed stay-days
    (= (stay-days london) 0)
    (= (stay-days bucharest) 0)
    (= (stay-days riga) 0)

    ;; Direct flights (only these may be used)
    (flight london bucharest)
    (flight bucharest london)
    (flight bucharest riga)
    (flight riga bucharest)

    ;; Workshop location (must be attended between day 5 and day 8 inclusive)
    (workshop riga)
  )

  ;; Goals:
  ;; - consume exactly 8 days (day counter becomes 9)
  ;; - agent1 must have attended the workshop in Riga (attended between day 5..8)
  ;; - agent1 must have visited London, Bucharest and Riga during the trip
  (:goal
    (and
      (= (day) 9)
      (attended-workshop agent1)
      (visited agent1 london)
      (visited agent1 bucharest)
      (visited agent1 riga)
    )
  )
)