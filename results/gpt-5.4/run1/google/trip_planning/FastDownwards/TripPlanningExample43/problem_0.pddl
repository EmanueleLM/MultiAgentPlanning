(define (problem european_trip_10_days_instance_problem)
  (:domain european_trip_10_days_instance)

  (:objects
    venice porto dublin - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 - day
  )

  (:init
    (next_day day1 day2)
    (next_day day2 day3)
    (next_day day3 day4)
    (next_day day4 day5)
    (next_day day5 day6)
    (next_day day6 day7)
    (next_day day7 day8)
    (next_day day8 day9)
    (next_day day9 day10)

    (direct_flight dublin porto)
    (direct_flight porto dublin)
    (direct_flight venice dublin)
    (direct_flight dublin venice)

    (current_day day1)
  )

  (:goal
    (and
      (venice_day4)
      (porto_day4)
      (dublin_day4)
      (met_friends)
      (trip_finished)
    )
  )
)