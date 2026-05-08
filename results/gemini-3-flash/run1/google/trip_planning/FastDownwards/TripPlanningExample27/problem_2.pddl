(define (problem trip_planning_example_27)
  (:domain trip_planning)
  (:objects
    istanbul amsterdam santorini - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 - day
    n0 n1 n2 n3 n4 n5 n6 n7 - count
  )

  (:init
    (not_started)
    (current_day d1)
    
    ;; Initial city counts
    (city_count istanbul n0)
    (city_count amsterdam n0)
    (city_count santorini n0)

    ;; Successor relations for days
    (next_day d1 d2) (next_day d2 d3) (next_day d3 d4) (next_day d4 d5)
    (next_day d5 d6) (next_day d6 d7) (next_day d7 d8) (next_day d8 d9)
    (next_day d9 d10) (next_day d10 d11) (next_day d11 d12) (next_day d12 d13)
    (next_day d13 d14)

    ;; Successor relations for stay counts
    (next_count n0 n1) (next_count n1 n2) (next_count n2 n3) (next_count n3 n4)
    (next_count n4 n5) (next_count n5 n6) (next_count n6 n7)

    ;; Flight connectivity (bidirectional as per travel convention)
    (can_fly amsterdam santorini) (can_fly santorini amsterdam)
    (can_fly istanbul amsterdam) (can_fly amsterdam istanbul)
  )

  (:goal (and
    ;; Required stay durations (total credits across 14 days)
    (city_count istanbul n6)
    (city_count amsterdam n7)
    (city_count santorini n3)

    ;; Hard constraints for relative visits in Santorini
    (visited santorini d12)
    (visited santorini d13)
    (visited santorini d14)

    ;; Ensure the plan reaches the final day of the 14-day trip
    (current_day d14)
  ))
)