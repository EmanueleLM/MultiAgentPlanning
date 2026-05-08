(define (problem european_trip_9_days_instance_problem)
  (:domain european_trip_9_days_instance)

  (:objects
    prague vienna porto - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 - day
  )

  (:init
    (current_day day1)

    (next_day day1 day2)
    (next_day day2 day3)
    (next_day day3 day4)
    (next_day day4 day5)
    (next_day day5 day6)
    (next_day day6 day7)
    (next_day day7 day8)
    (next_day day8 day9)
    (last_day day9)

    (flight vienna porto)
    (flight porto vienna)
    (flight prague vienna)
    (flight vienna prague)

    (workshop_window day1)
    (workshop_window day2)
    (workshop_window day3)

    (at prague)

    (prague_count_0)
    (vienna_count_0)
    (porto_count_0)
  )

  (:goal
    (and
      (assigned day1)
      (assigned day2)
      (assigned day3)
      (assigned day4)
      (assigned day5)
      (assigned day6)
      (assigned day7)
      (assigned day8)
      (assigned day9)

      (attended_workshop)

      (prague_count_3)
      (vienna_count_3)
      (porto_count_5)
    )
  )
)