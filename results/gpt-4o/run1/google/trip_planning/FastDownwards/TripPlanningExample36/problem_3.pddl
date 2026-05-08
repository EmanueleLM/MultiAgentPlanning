(define (problem european_trip_problem)
  (:domain european_trip)
  (:objects
    florence munich warsaw - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 - day
  )
  (:init
    (at florence d1)
    ;; Define the day sequence
    (next d1 d2) (next d2 d3) (next d3 d4) (next d4 d5) (next d5 d6)
    (next d6 d7) (next d7 d8) (next d8 d9) (next d9 d10) (next d10 d11)
    (next d11 d12) (next d12 d13)
  )
  (:goal
    (and
      ;; Ensuring each city is visited
      (visited florence) (visited munich) (visited warsaw)
      ;; Ensuring specific stay durations
      (at florence d3)
      (at munich d9)
      (at warsaw d13)
    )
  )
)