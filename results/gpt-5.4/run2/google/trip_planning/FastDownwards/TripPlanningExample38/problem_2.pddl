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

    (conference_day day4)
    (conference_day day5)
  )

  (:goal
    (and
      (visited geneva day1)
      (visited geneva day2)

      (visited madrid day1)
      (visited madrid day2)
      (visited madrid day3)

      (visited venice day4)
      (visited venice day5)

      (at venice day4)
      (at venice day5)
    )
  )
)