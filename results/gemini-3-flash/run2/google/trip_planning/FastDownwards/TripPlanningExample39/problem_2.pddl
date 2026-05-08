(define (problem trip_planning_example_39_prob)
  (:domain trip_planning_example_39)
  (:objects
    porto barcelona florence - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 - day
    c0 c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 c12 - count
  )
  (:init
    ;; Starting point
    (at porto)
    (current_day d1)
    (stay_count porto c0)
    (stay_count barcelona c0)
    (stay_count florence c0)

    ;; City markers
    (is_porto porto)
    (is_barcelona barcelona)
    (is_florence florence)

    ;; Travel connectivity
    (can_fly porto barcelona)
    (can_fly barcelona porto)
    (can_fly barcelona florence)
    (can_fly florence barcelona)

    ;; Temporal progression
    (next_day d1 d2) (next_day d2 d3) (next_day d3 d4) (next_day d4 d5)
    (next_day d5 d6) (next_day d6 d7) (next_day d7 d8) (next_day d8 d9)
    (next_day d9 d10) (next_day d10 d11) (next_day d11 d12) (next_day d12 d13)

    ;; Count progression
    (next_count c0 c1) (next_count c1 c2) (next_count c2 c3) (next_count c3 c4)
    (next_count c4 c5) (next_count c5 c6) (next_count c6 c7) (next_count c7 c8)
    (next_count c8 c9) (next_count c9 c10) (next_count c10 c11) (next_count c11 c12)

    ;; Porto Relative Visit window (Day 1 to 3)
    (is_within_visit_window d1)
    (is_within_visit_window d2)
    (is_within_visit_window d3)

    ;; Satisfaction criteria
    (at_least_3 c3) (at_least_3 c4) (at_least_3 c5) (at_least_3 c6) (at_least_3 c7) (at_least_3 c8) (at_least_3 c9) (at_least_3 c10) (at_least_3 c11) (at_least_3 c12)
    (at_least_7 c7) (at_least_7 c8) (at_least_7 c9) (at_least_7 c10) (at_least_7 c11) (at_least_7 c12)
    (at_least_4 c4) (at_least_4 c5) (at_least_4 c6) (at_least_4 c7) (at_least_4 c8) (at_least_4 c9) (at_least_4 c10) (at_least_4 c11) (at_least_4 c12)
  )
  (:goal
    (and
      (relatives_visited)
      (porto_satisfied)
      (barcelona_satisfied)
      (florence_satisfied)
      (current_day d13)
    )
  )
)