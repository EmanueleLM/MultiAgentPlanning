(define (problem trip_planning_problem)
  (:domain trip_planning)

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

    ;; Start state: traveler is in Lyon on day 1, and day1 is already used.
    (at lyon d1)
    (used d1)
  )

  (:goal
    (and
      ;; All 10 days must be assigned (exactly one city per day enforced by the used predicate)
      (used d1) (used d2) (used d3) (used d4) (used d5) (used d6) (used d7) (used d8) (used d9) (used d10)
      ;; Krakow show attendance: must be in Krakow on days 8, 9, and 10
      (at krakow d8)
      (at krakow d9)
      (at krakow d10)
    )
  )
)