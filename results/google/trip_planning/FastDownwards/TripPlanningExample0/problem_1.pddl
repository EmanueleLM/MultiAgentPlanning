(define (problem trip-problem)
  (:domain trip)
  (:objects
    florence barcelona helsinki - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 - day
  )
  (:init
    (next day1 day2) (next day2 day3) (next day3 day4) (next day4 day5)
    (next day5 day6) (next day6 day7) (next day7 day8) (next day8 day9)
    (next day9 day10) (next day10 day11) (next day11 day12) (next day12 day13)
    (next day13 day14)

    (conn barcelona florence)
    (conn florence barcelona)
    (conn helsinki barcelona)
    (conn barcelona helsinki)

    (at helsinki day1)

    (free day2) (free day3) (free day4) (free day5) (free day6) (free day7)
    (free day8) (free day9) (free day10) (free day11) (free day12) (free day13) (free day14)
  )
  (:goal
    (and
      (at helsinki day1)
      (at helsinki day2)
      (at helsinki day3)
      (at helsinki day4)
      (at barcelona day5)
      (at barcelona day6)
      (at barcelona day7)
      (at barcelona day8)
      (at florence day9)
      (at florence day10)
      (at florence day11)
      (at florence day12)
      (at florence day13)
      (at florence day14)
    )
  )
)