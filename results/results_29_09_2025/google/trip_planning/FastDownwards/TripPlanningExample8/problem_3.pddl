(define (problem trip-16-days)
  (:domain itinerary)
  (:objects
    athens krakow zurich - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 - day
  )

  (:init
    ;; direct flights (bidirectional as permitted by the specification)
    (flight zurich krakow)
    (flight krakow zurich)
    (flight athens zurich)
    (flight zurich athens)

    ;; day ordering
    (next d1 d2) (next d2 d3) (next d3 d4) (next d4 d5) (next d5 d6) (next d6 d7)
    (next d7 d8) (next d8 d9) (next d9 d10) (next d10 d11) (next d11 d12)
    (next d12 d13) (next d13 d14) (next d14 d15) (next d15 d16)

    ;; Athens visit covering days 1 through 7 (relatives visit requirement)
    (at athens d1) (at athens d2) (at athens d3) (at athens d4) (at athens d5) (at athens d6) (at athens d7)

    ;; remaining days initially unassigned
    (unassigned d8) (unassigned d9) (unassigned d10) (unassigned d11) (unassigned d12) (unassigned d13) (unassigned d14) (unassigned d15) (unassigned d16)

    ;; initial counts: Athens already covers days 1-7
    (= (athens-days) 7)
    (= (krakow-days) 0)
    (= (zurich-days) 0)
    (= (total-flights) 0)
  )

  (:goal
    (and
      (= (athens-days) 7)
      (= (krakow-days) 6)
      (= (zurich-days) 5)
    )
  )

  (:metric minimize (total-flights))
)