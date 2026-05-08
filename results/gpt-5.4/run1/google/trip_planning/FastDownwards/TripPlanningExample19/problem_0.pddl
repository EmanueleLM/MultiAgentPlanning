(define (problem europe_trip_9_days_instance_problem)
  (:domain europe_trip_9_days_instance)

  (:objects
    brussels valencia nice - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 - day
  )

  (:init
    (trip_not_started)

    (direct_flight brussels valencia)
    (direct_flight valencia brussels)
    (direct_flight brussels nice)
    (direct_flight nice brussels)

    (next_day day_1 day_2)
    (next_day day_2 day_3)
    (next_day day_3 day_4)
    (next_day day_4 day_5)
    (next_day day_5 day_6)
    (next_day day_6 day_7)
    (next_day day_7 day_8)
    (next_day day_8 day_9)

    (b_count_0)
    (v_count_0)
    (n_count_0)
  )

  (:goal
    (and
      (current_day day_9)
      (b_count_2)
      (v_count_3)
      (n_count_6)
      (meeting_satisfied)
    )
  )
)