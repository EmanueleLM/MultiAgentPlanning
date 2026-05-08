(define (problem tripplanningexample8_problem_min_init)
  (:domain tripplanningexample8_min_init)

  (:objects
    athens zurich krakow - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 day15 day16 - day
  )

  (:init
    (current_day day1)
    (at athens)
    (need_athens_1)
    (need_zurich_1)
    (need_krakow_1)
  )

  (:goal
    (and
      (trip_finished)
    )
  )
)