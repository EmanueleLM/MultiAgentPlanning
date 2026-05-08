(define (problem trip_planning_example0_problem)
  (:domain trip_planning_example0)

  (:objects
    barcelona florence helsinki - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 day_12 day_13 day_14 - day
  )

  (:init
    (direct barcelona florence)
    (direct florence barcelona)
    (direct helsinki barcelona)
    (direct barcelona helsinki)

    (next day_1 day_2)
    (next day_2 day_3)
    (next day_3 day_4)
    (next day_4 day_5)
    (next day_5 day_6)
    (next day_6 day_7)
    (next day_7 day_8)
    (next day_8 day_9)
    (next day_9 day_10)
    (next day_10 day_11)
    (next day_11 day_12)
    (next day_12 day_13)
    (next day_13 day_14)

    (current_day day_1)
    (at barcelona)

    (need_barcelona_5)
    (need_florence_6)
    (need_helsinki_5)
  )

  (:goal
    (and
      (current_day day_14)
      (recorded day_14)
      (done_barcelona)
      (done_florence)
      (done_helsinki)
      (met_friend)
    )
  )
)