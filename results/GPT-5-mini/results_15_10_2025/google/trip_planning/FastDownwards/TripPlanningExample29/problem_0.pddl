(define (problem trip-10-days)
  (:domain travel-multiagent)
  (:objects
    dubrovnik frankfurt krakow - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 - day
  )
  (:init
    ;; initial location: start in Dubrovnik on day 1 (assumption to realize Dubrovnik 7-day stay earliest)
    (in dubrovnik d1)

    ;; day successor chain
    (next d1 d2) (next d2 d3) (next d3 d4) (next d4 d5) (next d5 d6)
    (next d6 d7) (next d7 d8) (next d8 d9) (next d9 d10)

    ;; Note: no other (in ...) facts for days d2..d10 — these will be established by stay/fly actions
  )

  ;; Goal: explicit per-day city assignments matching the chosen itinerary:
  ;; Days 1-7 Dubrovnik, Day 8 Frankfurt, Days 9-10 Krakow (satisfies wedding presence on days 9 and 10)
  (:goal (and
    (in dubrovnik d1) (in dubrovnik d2) (in dubrovnik d3)
    (in dubrovnik d4) (in dubrovnik d5) (in dubrovnik d6) (in dubrovnik d7)
    (in frankfurt d8)
    (in krakow d9) (in krakow d10)
  ))
)