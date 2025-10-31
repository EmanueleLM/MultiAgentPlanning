(define (problem trip_planning_problem)
  (:domain trip_planning)

  ;; Objects: explicit days 1..10 and the three cities
  (:objects
    lyon frankfurt krakow - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 - day
  )

  (:init
    ;; day succession chain enforces discrete days 1..10
    (next d1 d2)
    (next d2 d3)
    (next d3 d4)
    (next d4 d5)
    (next d5 d6)
    (next d6 d7)
    (next d7 d8)
    (next d8 d9)
    (next d9 d10)

    ;; direct-flight availability (only the declared one-hop links)
    (direct-flight lyon frankfurt)
    (direct-flight frankfurt lyon)
    (direct-flight frankfurt krakow)
    (direct-flight krakow frankfurt)

    ;; Start state: traveler is in Lyon on day 1
    (at lyon d1)
  )

  ;; Goals (hard constraints):
  ;; - Attend the Krakow show by being in Krakow on days 8, 9, and 10.
  ;; Reaching these facts forces the planner to produce a 9-step sequence of stay/travel actions
  ;; following the next chain from d1 to d10 and to use only allowed direct flights.
  (:goal
    (and
      (at krakow d8)
      (at krakow d9)
      (at krakow d10)
    )
  )
)