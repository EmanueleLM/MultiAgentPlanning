(define (problem trip_problem_15days)
  (:domain trip_domain_multiagent)
  (:objects
    riga manchester split - city
  )

  (:init
    ;; start location (chosen so the available direct flights can be used to reach all cities)
    (at riga)

    ;; numeric init
    (= (total-days) 0)
    (= (days riga) 0)
    (= (days manchester) 0)
    (= (days split) 0)
  )

  ;; Global goal: visit all three cities and spend exactly 15 days total.
  (:goal (and
    (visited riga)
    (visited manchester)
    (visited split)
    (= (total-days) 15)
  ))
)