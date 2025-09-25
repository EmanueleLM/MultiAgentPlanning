(define (problem trip-14days)
  (:domain trip-integration)
  (:objects
    barcelona florence helsinki - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 - day
  )
  (:init
    (current-day day1)
    (at barcelona)
    (next day1 day2) (next day2 day3) (next day3 day4) (next day4 day5)
    (next day5 day6) (next day6 day7) (next day7 day8) (next day8 day9)
    (next day9 day10) (next day10 day11) (next day11 day12) (next day12 day13)
    (next day13 day14)
    (connected barcelona florence)
    (connected florence barcelona)
    (connected helsinki barcelona)
    (connected barcelona helsinki)
    (meet_window day9) (meet_window day10) (meet_window day11)
    (meet_window day12) (meet_window day13) (meet_window day14)
    (is-florence florence)
  )
  (:goal
    (and
      (spent barcelona day1) (spent barcelona day2) (spent barcelona day3)
      (spent barcelona day4) (spent barcelona day5)
      (spent helsinki day6) (spent helsinki day7) (spent helsinki day8)
      (spent florence day9) (spent florence day10) (spent florence day11)
      (spent florence day12) (spent florence day13) (spent florence day14)
      (met)
    )
  )
)