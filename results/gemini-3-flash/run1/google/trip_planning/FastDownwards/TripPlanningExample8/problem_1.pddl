(define (problem trip_planning_example8_prob)
  (:domain trip_planning_example8)
  (:objects
    athens zurich krakow - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 d17 - day
    n0 n1 n2 n3 n4 n5 n6 n7 n8 n9 n10 n11 n12 n13 n14 n15 n16 - count
  )
  (:init
    ;; Starting position
    (at athens)
    (current_day d1)

    ;; Stay counts initialized to zero
    (city_stay_count athens n0)
    (city_stay_count zurich n0)
    (city_stay_count krakow n0)

    ;; Day sequence (1 to 16, d17 marks the end of day 16)
    (next_day d1 d2) (next_day d2 d3) (next_day d3 d4) (next_day d4 d5)
    (next_day d5 d6) (next_day d6 d7) (next_day d7 d8) (next_day d8 d9)
    (next_day d9 d10) (next_day d10 d11) (next_day d11 d12) (next_day d12 d13)
    (next_day d13 d14) (next_day d14 d15) (next_day d15 d16) (next_day d16 d17)

    ;; Count sequence
    (next_count n0 n1) (next_count n1 n2) (next_count n2 n3) (next_count n3 n4)
    (next_count n4 n5) (next_count n5 n6) (next_count n6 n7) (next_count n7 n8)
    (next_count n8 n9) (next_count n9 n10) (next_count n10 n11) (next_count n11 n12)
    (next_count n12 n13) (next_count n13 n14) (next_count n14 n15) (next_count n15 n16)

    ;; City connections (direct flights)
    (connected zurich krakow) (connected krakow zurich)
    (connected athens zurich) (connected zurich athens)

    ;; Relative visit window constraint: Athens visit must be between Day 1 and Day 7.
    (can_visit athens d1) (can_visit athens d2) (can_visit athens d3)
    (can_visit athens d4) (can_visit athens d5) (can_visit athens d6)
    (can_visit athens d7)
    ;; Zurich and Krakow have no window constraints (available throughout the trip)
    (can_visit zurich d1) (can_visit zurich d2) (can_visit zurich d3) (can_visit zurich d4)
    (can_visit zurich d5) (can_visit zurich d6) (can_visit zurich d7) (can_visit zurich d8)
    (can_visit zurich d9) (can_visit zurich d10) (can_visit zurich d11) (can_visit zurich d12)
    (can_visit zurich d13) (can_visit zurich d14) (can_visit zurich d15) (can_visit zurich d16)
    (can_visit krakow d1) (can_visit krakow d2) (can_visit krakow d3) (can_visit krakow d4)
    (can_visit krakow d5) (can_visit krakow d6) (can_visit krakow d7) (can_visit krakow d8)
    (can_visit krakow d9) (can_visit krakow d10) (can_visit krakow d11) (can_visit krakow d12)
    (can_visit krakow d13) (can_visit krakow d14) (can_visit krakow d15) (can_visit krakow d16)
  )
  (:goal
    (and
      ;; Total trip duration must be 16 days.
      (current_day d17)
      ;; Spend 7 days in Athens.
      (city_stay_count athens n7)
      ;; Spend 5 days in Zurich.
      (city_stay_count zurich n5)
      ;; Spend 6 days in Krakow.
      (city_stay_count krakow n6)
    )
  )
)