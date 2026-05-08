(define (problem trip_planning_problem)
  (:domain trip_planning)
  (:objects
    istanbul budapest dubrovnik - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 - day
    n0 n1 n2 n3 n4 n5 n6 - count
  )
  (:init
    (not_started)
    (is_first_day d1)
    (is_last_day d12)

    ;; Day sequence
    (next_day d1 d2) (next_day d2 d3) (next_day d3 d4) (next_day d4 d5)
    (next_day d5 d6) (next_day d6 d7) (next_day d7 d8) (next_day d8 d9)
    (next_day d9 d10) (next_day d10 d11) (next_day d11 d12)

    ;; Counter sequence
    (next_count n0 n1) (next_count n1 n2) (next_count n2 n3)
    (next_count n3 n4) (next_count n4 n5) (next_count n5 n6)

    ;; Initial visit counts
    (city_count istanbul n0)
    (city_count budapest n0)
    (city_count dubrovnik n0)

    ;; Flight connections
    ;; Istanbul and Budapest (bidirectional)
    (flight istanbul budapest)
    (flight budapest istanbul)
    ;; From Dubrovnik to Istanbul (unidirectional)
    (flight dubrovnik istanbul)
  )
  (:goal
    (and
      (city_count istanbul n5)
      (city_count budapest n6)
      (city_count dubrovnik n3)
      (trip_done)
    )
  )
)