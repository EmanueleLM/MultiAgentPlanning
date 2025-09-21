(define (problem multi-trip-problem)
  (:domain multi-agent-trip)
  (:objects
    agent1 agent2 - agent
    london bucharest riga - city
  )
  (:init
    ;; Start on day 1
    (day1)

    ;; Initial locations
    (at agent1 london)
    (at agent2 london)

    ;; agent1 has visited the start city
    (visited agent1 london)

    ;; Total cost starts at 0
    (= (total-cost) 0)

    ;; Direct flights (only these may be used)
    (flight london bucharest)
    (flight bucharest london)
    (flight bucharest riga)
    (flight riga bucharest)

    ;; Workshop location
    (workshop riga)
  )

  (:goal
    (and
      (day9)
      (attended-workshop agent1)
      (visited agent1 london)
      (visited agent1 bucharest)
      (visited agent1 riga)
    )
  )

  (:metric minimize (total-cost))
)