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
      (at venice day4)
      (at venice day5)

      (at geneva day1)
      (at geneva day2)

      (at madrid day1)
      (at madrid day2)
      (at madrid day3)

      (at venice day1)
      (at venice day2)
    )
  )
)