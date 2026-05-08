(define (problem european_trip_15_days_instance_problem)
  (:domain european_trip_15_days_instance)

  (:objects
    vienna vilnius valencia - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 day_12 day_13 day_14 day_15 - day
  )

  (:init
    (direct vienna valencia)
    (direct valencia vienna)
    (direct vilnius vienna)
    (direct vienna vilnius)

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
    (next_day day_14 day_15)

    (start_day day_1)
  )

  (:goal
    (and
      (assigned day_1)
      (assigned day_2)
      (assigned day_3)
      (assigned day_4)
      (assigned day_5)
      (assigned day_6)
      (assigned day_7)
      (assigned day_8)
      (assigned day_9)
      (assigned day_10)
      (assigned day_11)
      (assigned day_12)
      (assigned day_13)
      (assigned day_14)
      (assigned day_15)

      (at day_9 valencia)
      (at day_15 valencia)

      (at day_1 vienna)
      (at day_2 vienna)
      (at day_3 vienna)
      (at day_4 vienna)
      (at day_5 vienna)

      (at day_6 vilnius)
      (at day_7 vilnius)
      (at day_8 vilnius)
      (at day_9 vilnius)
      (at day_10 vilnius)

      (at day_9 valencia)
      (at day_10 valencia)
      (at day_11 valencia)
      (at day_12 valencia)
      (at day_13 valencia)
      (at day_14 valencia)
      (at day_15 valencia)
    )
  )
)