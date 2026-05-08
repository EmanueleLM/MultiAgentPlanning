(define (problem trip_planning_problem)
  (:domain trip_planning)
  (:objects
    istanbul budapest dubrovnik - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 - day
    n0 n1 n2 n3 n4 n5 n6 n7 n8 n9 n10 n11 n12 - count
  )
  (:init
    ;; Days sequence
    (first_day d1)
    (is_last_day d12)
    (next_day d1 d2) (next_day d2 d3) (next_day d3 d4) (next_day d4 d5)
    (next_day d5 d6) (next_day d6 d7) (next_day d7 d8) (next_day d8 d9)
    (next_day d9 d10) (next_day d10 d11) (next_day d11 d12)

    ;; Counter sequence
    (next_count n0 n1) (next_count n1 n2) (next_count n2 n3) (next_count n3 n4)
    (next_count n4 n5) (next_count n5 n6) (next_count n6 n7) (next_count n7 n8)
    (next_count n8 n9) (next_count n9 n10) (next_count n10 n11) (next_count n11 n12)

    ;; Initial visit counts
    (visited_count istanbul n0)
    (visited_count budapest n0)
    (visited_count dubrovnik n0)

    ;; Direct flight connections
    ;; Istanbul and Budapest (interpreted as bidirectional)
    (flight istanbul budapest)
    (flight budapest istanbul)
    ;; Dubrovnik to Istanbul (interpreted as unidirectional)
    (flight dubrovnik istanbul)
  )
  (:goal
    (and
      ;; The specified stay requirements (Sum = 14)
      (visited_count istanbul n5)
      (visited_count budapest n6)
      (visited_count dubrovnik n3)
      ;; Ensure the plan covers the entire 12-day trip
      (trip_done)
    )
  )
)