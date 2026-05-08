(define (problem european_trip_13_days_instance_problem)
  (:domain european_trip_13_days_instance)

  (:objects
    florence munich warsaw - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 - day
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
    (next_day day9 day10)
    (next_day day10 day11)
    (next_day day11 day12)
    (next_day day12 day13)

    (last_day day13)

    (direct_flight florence munich)
    (direct_flight florence warsaw)
    (direct_flight munich florence)
    (direct_flight munich warsaw)
    (direct_flight warsaw florence)
    (direct_flight warsaw munich)

    (florence_count_0)
    (munich_count_0)
    (warsaw_count_0)
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
      (assigned day10)
      (assigned day11)
      (assigned day12)
      (assigned day13)
      (trip_finished)
    )
  )
)