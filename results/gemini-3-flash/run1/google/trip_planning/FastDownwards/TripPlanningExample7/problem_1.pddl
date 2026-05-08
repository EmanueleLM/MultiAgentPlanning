(define (problem trip_example)
  (:domain trip_planning)
  (:objects
    dubrovnik istanbul venice - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 - day
    n0 n1 n2 n3 n4 n5 n6 n7 n8 n9 n10 n11 - count
  )
  (:init
    ;; Starting conditions
    (at dubrovnik)
    (current_day d1)
    (city_count dubrovnik n1)
    (city_count istanbul n0)
    (city_count venice n0)

    ;; Temporal sequence (11 days total)
    (next_day d1 d2)
    (next_day d2 d3)
    (next_day d3 d4)
    (next_day d4 d5)
    (next_day d5 d6)
    (next_day d6 d7)
    (next_day d7 d8)
    (next_day d8 d9)
    (next_day d9 d10)
    (next_day d10 d11)

    ;; Symbolic counters for stay durations
    (next_count n0 n1)
    (next_count n1 n2)
    (next_count n2 n3)
    (next_count n3 n4)
    (next_count n4 n5)
    (next_count n5 n6)
    (next_count n6 n7)
    (next_count n7 n8)
    (next_count n8 n9)
    (next_count n9 n10)
    (next_count n10 n11)

    ;; Direct flight connectivity
    ;; Interpretation of "from Dubrovnik to Istanbul, Istanbul and Venice"
    (has_flight dubrovnik istanbul)
    (has_flight istanbul venice)
    (has_flight dubrovnik venice)
  )
  (:goal
    (and
      ;; Total trip duration matches the 11-day constraint
      (current_day d11)
      ;; Required stay durations in each city
      (city_count dubrovnik n4)
      (city_count istanbul n3)
      (city_count venice n6)
    )
  )
)