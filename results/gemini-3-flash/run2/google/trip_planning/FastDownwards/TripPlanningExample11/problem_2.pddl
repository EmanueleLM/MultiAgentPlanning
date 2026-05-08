(define (problem trip_planning_instance)
  (:domain trip_planning)
  (:objects
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 - day
    c0 c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 c12 c13 c14 c15 c16 c17 - count
  )
  (:init
    (stay_count vienna c0)
    (stay_count vilnius c0)
    (stay_count valencia c0)

    ;; Adjacency mapping
    (can_fly vienna valencia)
    (can_fly valencia vienna)
    (can_fly vienna vilnius)
    (can_fly vilnius vienna)

    ;; Temporal sequence
    (next_day d1 d2) (next_day d2 d3) (next_day d3 d4) (next_day d4 d5) (next_day d5 d6)
    (next_day d6 d7) (next_day d7 d8) (next_day d8 d9) (next_day d9 d10) (next_day d10 d11)
    (next_day d11 d12) (next_day d12 d13) (next_day d13 d14) (next_day d14 d15)

    ;; Stay count mapping
    (next_count c0 c1) (next_count c1 c2) (next_count c2 c3) (next_count c3 c4) (next_count c4 c5)
    (next_count c5 c6) (next_count c6 c7) (next_count c7 c8) (next_count c8 c9) (next_count c9 c10)
    (next_count c10 c11) (next_count c11 c12) (next_count c12 c13) (next_count c13 c14) (next_count c14 c15)
    (next_count c15 c16) (next_count c16 c17)

    ;; Threshold definitions
    (at_least_5 c5) (at_least_5 c6) (at_least_5 c7) (at_least_5 c8) (at_least_5 c9) 
    (at_least_5 c10) (at_least_5 c11) (at_least_5 c12) (at_least_5 c13) (at_least_5 c14) 
    (at_least_5 c15) (at_least_5 c16) (at_least_5 c17)

    (at_least_7 c7) (at_least_7 c8) (at_least_7 c9) (at_least_7 c10) (at_least_7 c11) 
    (at_least_7 c12) (at_least_7 c13) (at_least_7 c14) (at_least_7 c15) (at_least_7 c16) (at_least_7 c17)
  )
  (:goal
    (and
      (current_day d15)
      (vienna_ready)
      (vilnius_ready)
      (valencia_ready)
      (conf_9_attended)
      (conf_15_attended)
    )
  )
)