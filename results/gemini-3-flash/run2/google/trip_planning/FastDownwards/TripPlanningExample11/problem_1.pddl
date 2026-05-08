(define (problem trip_planning_instance)
  (:domain trip_planning)
  (:objects
    vienna vilnius valencia - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 - day
    c0 c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 c12 c13 c14 c15 - count
  )
  (:init
    (current_day d1)
    (count_vienna c0)
    (count_vilnius c0)
    (count_valencia c0)

    (next_day d1 d2) (next_day d2 d3) (next_day d3 d4) (next_day d4 d5) (next_day d5 d6)
    (next_day d6 d7) (next_day d7 d8) (next_day d8 d9) (next_day d9 d10) (next_day d10 d11)
    (next_day d11 d12) (next_day d12 d13) (next_day d13 d14) (next_day d14 d15)

    (next_count c0 c1) (next_count c1 c2) (next_count c2 c3) (next_count c3 c4) (next_count c4 c5)
    (next_count c5 c6) (next_count c6 c7) (next_count c7 c8) (next_count c8 c9) (next_count c9 c10)
    (next_count c10 c11) (next_count c11 c12) (next_count c12 c13) (next_count c13 c14) (next_count c14 c15)

    (is_at_least_5 c5) (is_at_least_5 c6) (is_at_least_5 c7) (is_at_least_5 c8) (is_at_least_5 c9) 
    (is_at_least_5 c10) (is_at_least_5 c11) (is_at_least_5 c12) (is_at_least_5 c13) (is_at_least_5 c14) (is_at_least_5 c15)

    (is_at_least_7 c7) (is_at_least_7 c8) (is_at_least_7 c9) (is_at_least_7 c10) (is_at_least_7 c11) 
    (is_at_least_7 c12) (is_at_least_7 c13) (is_at_least_7 c14) (is_at_least_7 c15)
  )
  (:goal
    (and
      (vienna_ok)
      (vilnius_ok)
      (valencia_ok)
      (conf_9_ok)
      (conf_15_ok)
      (current_day d15)
    )
  )
)