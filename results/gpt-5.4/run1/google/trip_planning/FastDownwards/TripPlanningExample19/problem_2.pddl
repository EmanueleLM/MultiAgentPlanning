(define (problem europe_trip_9_days_instance_problem)
  (:domain europe_trip_9_days_instance)

  (:objects
    brussels valencia nice - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 - day
  )

  (:init
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

    (total_days_0)
    (brussels_days_0)
    (valencia_days_0)
    (nice_days_0)
  )

  (:goal
    (and
      (current_day day_9)
      (total_days_9)
      (brussels_days_2)
      (valencia_days_3)
      (nice_days_6)
      (friends_met)
    )
  )
)