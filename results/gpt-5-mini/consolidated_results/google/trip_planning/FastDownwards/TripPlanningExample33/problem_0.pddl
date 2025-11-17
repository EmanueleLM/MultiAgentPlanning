(define (problem trip13)
  (:domain trip-planning)
  (:objects
    rome barcelona krakow - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 - day
  )
  (:init
    ;; starting location
    (at rome d1)

    ;; day ordering
    (next d1 d2) (next d2 d3) (next d3 d4) (next d4 d5)
    (next d5 d6) (next d6 d7) (next d7 d8) (next d8 d9)
    (next d9 d10) (next d10 d11) (next d11 d12) (next d12 d13)

    ;; available direct flights (bidirectional where specified)
    (flight rome barcelona)
    (flight barcelona rome)
    (flight barcelona krakow)
    (flight krakow barcelona)

    ;; free markers for days that must be assigned by actions (day1 already assigned)
    (free d2) (free d3) (free d4) (free d5) (free d6) (free d7) (free d8) (free d9)
    (free d10) (free d11) (free d12) (free d13)
  )

  ;; Resolved itinerary (fits 13-day horizon and earliest feasible Krakow meeting on day 10):
  ;; - Rome: days 1-3 (3 days)
  ;; - Barcelona: days 4-9 (6 days)
  ;; - Krakow: days 10-13 (4 days)
  ;; This allocation respects direct-flight constraints (Rome<->Barcelona, Barcelona<->Krakow),
  ;; uses only listed direct flights, and ensures presence in Krakow on day 10 (meeting window day 10-13).
  (:goal (and
    ;; Rome stays (days 1-3)
    (at rome d1) (at rome d2) (at rome d3)
    ;; Barcelona stays (days 4-9)
    (at barcelona d4) (at barcelona d5) (at barcelona d6)
    (at barcelona d7) (at barcelona d8) (at barcelona d9)
    ;; Krakow stays (days 10-13) - includes meeting window (earliest day 10)
    (at krakow d10) (at krakow d11) (at krakow d12) (at krakow d13)
  ))
)