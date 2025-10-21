(define (problem pddl_orchestrator-problem)
  (:domain pddl_orchestrator)

  ;; Objects: explicit days 1..10 and the cities referenced by the agents' reports
  (:objects
    lyon krakow - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 - day
  )

  (:init
    ;; day succession chain enforces discrete days 1..10 and makes every day progression explicit
    (next d1 d2)
    (next d2 d3)
    (next d3 d4)
    (next d4 d5)
    (next d5 d6)
    (next d6 d7)
    (next d7 d8)
    (next d8 d9)
    (next d9 d10)

    ;; direct-flight availability (explicit one-hop links). Travel is permitted only on declared direct flights.
    (direct-flight lyon krakow)
    (direct-flight krakow lyon)

    ;; Start state: traveler is in Lyon on day 1 (assumption consistent with the presence of a "lyon" preference agent).
    (at lyon d1)
  )

  ;; Goals:
  ;; - Enforce attendance at the Krakow show by requiring the traveler to be at Krakow on days 8, 9, and 10.
  ;; - Enforce exactly 10 discrete days by requiring the plan reach day 10 (presence at day10 will only be produced
  ;;   by a sequence of 9 travel/stay actions that follow the next chain).
  (:goal
    (and
      (at krakow d8)
      (at krakow d9)
      (at krakow d10)
    )
  )
)