(define (problem multi-trip-problem)
  (:domain multi-agent-trip)
  (:objects
    london bucharest riga - city
  )
  (:init
    (day1)
    (at agent1 london)
    (at agent2 london)
    (visited agent1 london)
    (= (total-cost) 0)
    (flight london bucharest)
    (flight bucharest london)
    (flight bucharest riga)
    (flight riga bucharest)
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