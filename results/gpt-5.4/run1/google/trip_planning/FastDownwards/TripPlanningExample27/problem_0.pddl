(define (problem european_trip_14day_instance_problem)
  (:domain european_trip_14day_instance)

  (:objects
    amsterdam istanbul santorini - city

    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 day_12 day_13 day_14 - day

    a0 a1 a2 a3 a4 a5 a6 a7 - amsterdam_count
    i0 i1 i2 i3 i4 i5 i6 - istanbul_count
    s0 s1 s2 s3 - santorini_count
  )

  (:init
    (next_day day_1 day_2)
    (next_day day_2 day_3)
    (next_day day_3 day_4)
    (next_day day_4 day_5)
    (next_day day_5 day_6)
    (next_day day_6 day_7)
    (next_day day_7 day_8)
    (next_day day_8 day_9)
    (next_day day_9 day_10)
    (next_day day_10 day_11)
    (next_day day_11 day_12)
    (next_day day_12 day_13)
    (next_day day_13 day_14)

    (current_day day_1)
    (last_day day_14)
    (unstarted)

    (direct_flight amsterdam santorini)
    (direct_flight santorini amsterdam)
    (direct_flight istanbul amsterdam)
    (direct_flight amsterdam istanbul)

    (window_day day_12)
    (window_day day_13)
    (window_day day_14)

    (a_count a0)
    (i_count i0)
    (s_count s0)

    (a_succ a0 a1)
    (a_succ a1 a2)
    (a_succ a2 a3)
    (a_succ a3 a4)
    (a_succ a4 a5)
    (a_succ a5 a6)
    (a_succ a6 a7)

    (i_succ i0 i1)
    (i_succ i1 i2)
    (i_succ i2 i3)
    (i_succ i3 i4)
    (i_succ i4 i5)
    (i_succ i5 i6)

    (s_succ s0 s1)
    (s_succ s1 s2)
    (s_succ s2 s3)
  )

  (:goal
    (and
      (finished)
      (assigned day_14)
      (a_count a7)
      (i_count i6)
      (s_count s3)
      (relatives_visited)
      (at_on day_14 amsterdam)
    )
  )
)