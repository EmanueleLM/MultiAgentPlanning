(define (problem trip_example)
  (:domain trip_planning)
  (:objects
    istanbul tallinn zurich - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 - day
    c0 c1 c2 c3 c4 c5 c6 c7 - count
  )
  (:init
    ;; Starting city (assume traveler begins at Istanbul and can fly to Zurich for Day 1 show)
    (at istanbul)
    (current_day d1)

    ;; Initial stay counts for all cities are zero
    (stay_count istanbul c0)
    (stay_count tallinn c0)
    (stay_count zurich c0)

    ;; Successor relations for days
    (next_day d1 d2) (next_day d2 d3) (next_day d3 d4) (next_day d4 d5)
    (next_day d5 d6) (next_day d6 d7) (next_day d7 d8) (next_day d8 d9)
    (next_day d9 d10) (next_day d10 d11) (next_day d11 d12) (next_day d12 d13)
    (next_day d13 d14) (next_day d14 d15)

    ;; Successor relations for stay counts
    (next_count c0 c1) (next_count c1 c2) (next_count c2 c3) (next_count c3 c4)
    (next_count c4 c5) (next_count c5 c6) (next_count c6 c7)

    ;; Connectivity based on provided flight pairs (interpreted as bidirectional)
    (conn istanbul tallinn) (conn tallinn istanbul)
    (conn istanbul zurich) (conn zurich istanbul)
    (conn tallinn zurich) (conn zurich tallinn)

    ;; Show constraint: Days 1-7 require being in Zurich.
    (can_stay zurich d1) (can_stay zurich d2) (can_stay zurich d3)
    (can_stay zurich d4) (can_stay zurich d5) (can_stay zurich d6)
    (can_stay zurich d7)

    ;; Non-show days: Any city is valid.
    (can_stay istanbul d8) (can_stay istanbul d9) (can_stay istanbul d10)
    (can_stay istanbul d11) (can_stay istanbul d12) (can_stay istanbul d13)
    (can_stay istanbul d14)
    (can_stay tallinn d8) (can_stay tallinn d9) (can_stay tallinn d10)
    (can_stay tallinn d11) (can_stay tallinn d12) (can_stay tallinn d13)
    (can_stay tallinn d14)
    (can_stay zurich d8) (can_stay zurich d9) (can_stay zurich d10)
    (can_stay zurich d11) (can_stay zurich d12) (can_stay zurich d13)
    (can_stay zurich d14)
  )
  (:goal
    (and
      ;; Visit 3 European cities for 14 days in total (reaching d15)
      (current_day d15)
      ;; Specific stay requirements from human specification
      (stay_count istanbul c5)
      (stay_count tallinn c4)
      (stay_count zurich c7)
    )
  )
)