(define (problem european_trip_problem)
  (:domain european_trip)
  (:objects
    florence munich warsaw - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 - day
  )
  (:init
    (at florence d1)
    (next d1 d2) (next d2 d3) (next d3 d4) (next d4 d5) (next d5 d6)
    (next d6 d7) (next d7 d8) (next d8 d9) (next d9 d10)
    (next d10 d11) (next d11 d12) (next d12 d13)
  )
  (:goal
    (and
      ;; Hard Constraints: Ensure proper sequence of stays
      (at florence d3)         ;; 1st Stay: Florence (2 days)
      (at munich d9)           ;; 2nd Stay: Munich (6 days)
      (at warsaw d13)          ;; Final Day: Warsaw (6th day satisfied; totals 15 - adjust accordingly)
    )
  )
)