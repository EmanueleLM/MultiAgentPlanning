(define (problem trip_planning_example13_problem)
  (:domain trip_planning_example13)

  (:objects
    manchester bucharest lyon - city

    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 d17 - day

    n0 n1 n2 n3 n4 n5 n6 n7 - count
  )

  (:init
    (current_day d1)

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
    (next_day d11 d12)
    (next_day d12 d13)
    (next_day d13 d14)
    (next_day d14 d15)
    (next_day d15 d16)
    (next_day d16 d17)

    (next_count n0 n1)
    (next_count n1 n2)
    (next_count n2 n3)
    (next_count n3 n4)
    (next_count n4 n5)
    (next_count n5 n6)
    (next_count n6 n7)

    (direct_flight manchester bucharest)
    (direct_flight bucharest manchester)
    (direct_flight bucharest lyon)
    (direct_flight lyon bucharest)

    (lyon_window_day d13)
    (lyon_window_day d14)
    (lyon_window_day d15)
    (lyon_window_day d16)
    (lyon_window_day d17)

    (count_manchester n0)
    (count_bucharest n0)
    (count_lyon n0)
  )

  (:goal
    (and
      (trip_finished)
      (count_manchester n7)
      (count_bucharest n7)
      (count_lyon n5)
      (visited_relatives)
    )
  )
)