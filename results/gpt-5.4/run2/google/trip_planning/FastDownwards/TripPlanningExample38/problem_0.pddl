(define (problem european_trip_5_days_instance_problem)
  (:domain european_trip_5_days_instance)

  (:objects
    geneva madrid venice - city
    day1 day2 day3 day4 day5 - day
  )

  (:init
    (current_day day1)

    (next_day day1 day2)
    (next_day day2 day3)
    (next_day day3 day4)
    (next_day day4 day5)

    (direct_flight geneva madrid)
    (direct_flight madrid geneva)
    (direct_flight madrid venice)
    (direct_flight venice madrid)
  )

  (:goal
    (and
      (assigned day1)
      (assigned day2)
      (assigned day3)
      (assigned day4)
      (assigned day5)

      (at day4 venice)
      (at day5 venice)

      (used_geneva_1)
      (used_geneva_2)
      (used_madrid_1)
      (used_madrid_2)
      (used_madrid_3)
      (used_venice_1)
      (used_venice_2)
    )
  )
)