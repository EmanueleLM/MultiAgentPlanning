(define (problem trip_planning_example_11)
  (:domain trip_planning)
  (:objects
    vienna vilnius valencia - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 - day
    n0 n1 n2 n3 n4 n5 n6 n7 n8 n9 n10 n11 n12 n13 n14 n15 - count
  )
  (:init
    (at_start)
    
    ;; Time sequence
    (next_day d1 d2) (next_day d2 d3) (next_day d3 d4) (next_day d4 d5)
    (next_day d5 d6) (next_day d6 d7) (next_day d7 d8) (next_day d8 d9)
    (next_day d9 d10) (next_day d10 d11) (next_day d11 d12) (next_day d12 d13)
    (next_day d13 d14) (next_day d14 d15) (next_day d15 d16)
    
    ;; Numerical sequence
    (next_count n0 n1) (next_count n1 n2) (next_count n2 n3) (next_count n3 n4)
    (next_count n4 n5) (next_count n5 n6) (next_count n6 n7) (next_count n7 n8)
    (next_count n8 n9) (next_count n9 n10) (next_count n10 n11) (next_count n11 n12)
    (next_count n12 n13) (next_count n13 n14) (next_count n14 n15)

    ;; Initial stay counts
    (city_count vienna n0)
    (city_count vilnius n0)
    (city_count valencia n0)
    
    ;; Flight network
    (connected vienna valencia) (connected valencia vienna)
    (connected vienna vilnius) (connected vilnius vienna)
    
    ;; Stay duration thresholds
    (at_least_5 n5) (at_least_5 n6) (at_least_5 n7) (at_least_5 n8) (at_least_5 n9) (at_least_5 n10)
    (at_least_5 n11) (at_least_5 n12) (at_least_5 n13) (at_least_5 n14) (at_least_5 n15)
    
    (at_least_7 n7) (at_least_7 n8) (at_least_7 n9) (at_least_7 n10) (at_least_7 n11) (at_least_7 n12)
    (at_least_7 n13) (at_least_7 n14) (at_least_7 n15)
  )
  (:goal (and
    ;; Required stay durations
    (exists (?c1 - count) (and (city_count vilnius ?c1) (at_least_5 ?c1)))
    (exists (?c2 - count) (and (city_count vienna ?c2) (at_least_5 ?c2)))
    (exists (?c3 - count) (and (city_count valencia ?c3) (at_least_7 ?c3)))
    
    ;; Conference requirements
    (at_city_day valencia d9)
    (at_city_day valencia d15)
  ))
)