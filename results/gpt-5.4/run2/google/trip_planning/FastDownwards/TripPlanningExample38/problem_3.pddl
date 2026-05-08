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
      (in_city geneva day1)
      (in_city geneva day2)
      (in_city madrid day3)
      (in_city venice day4)
      (in_city venice day5)
    )
  )
)