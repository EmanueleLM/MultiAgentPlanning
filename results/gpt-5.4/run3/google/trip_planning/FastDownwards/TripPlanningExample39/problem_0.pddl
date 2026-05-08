(define (problem european_trip_12_days_instance_problem)
  (:domain european_trip_12_days_instance)

  (:objects
    porto barcelona florence - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 - day
  )

  (:init
    (direct porto barcelona)
    (direct barcelona porto)
    (direct barcelona florence)
    (direct florence barcelona)

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

    (porto_visit_window day1)
    (porto_visit_window day2)
    (porto_visit_window day3)

    (current_day day1)

    (porto_count_0)
    (barcelona_count_0)
    (florence_count_0)
  )

  (:goal
    (and
      (started)
      (current_day day12)
      (relatives_visited)
      (porto_count_3)
      (barcelona_count_7)
      (florence_count_4)
    )
  )
)