(define (problem european_trip_10_days_instance_problem)
  (:domain european_trip_10_days_instance)

  (:objects
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 - day
  )

  (:init
    (at venice)

    (direct_flight dublin porto)
    (direct_flight porto dublin)
    (direct_flight venice dublin)
    (direct_flight dublin venice)

    (current_day day1)
    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)
    (next day5 day6)
    (next day6 day7)
    (next day7 day8)
    (next day8 day9)
    (next day9 day10)
    (last_day day10)

    (friend_window day1)
    (friend_window day2)
    (friend_window day3)
    (friend_window day4)
  )

  (:goal
    (and
      (visited_day day1 venice)
      (visited_day day2 venice)
      (visited_day day3 venice)
      (visited_day day4 venice)
      (visited_day day7 porto)
      (visited_day day8 porto)
      (visited_day day9 porto)
      (visited_day day10 porto)
      (met_friends)
      (trip_finished)
    )
  )
)