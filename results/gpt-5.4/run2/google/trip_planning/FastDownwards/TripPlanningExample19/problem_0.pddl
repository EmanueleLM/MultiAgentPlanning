(define (problem european_trip_9_days_instance_problem)
  (:domain european_trip_9_days_instance)

  (:objects
    brussels valencia nice - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 - day
  )

  (:init
    (next_day d1 d2)
    (next_day d2 d3)
    (next_day d3 d4)
    (next_day d4 d5)
    (next_day d5 d6)
    (next_day d6 d7)
    (next_day d7 d8)
    (next_day d8 d9)

    (connected brussels valencia)
    (connected valencia brussels)
    (connected nice brussels)
    (connected brussels nice)

    (current_day d1)

    (brussels_count_0)
    (valencia_count_0)
    (nice_count_0)
  )

  (:goal
    (and
      (planning_done)
      (day_assigned d1)
      (day_assigned d2)
      (day_assigned d3)
      (day_assigned d4)
      (day_assigned d5)
      (day_assigned d6)
      (day_assigned d7)
      (day_assigned d8)
      (day_assigned d9)
      (brussels_count_2)
      (valencia_count_3)
      (nice_count_6)
      (met_friends)
    )
  )
)