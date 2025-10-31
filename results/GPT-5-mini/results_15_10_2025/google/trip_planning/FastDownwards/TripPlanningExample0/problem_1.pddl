(define (problem travel-problem)
  (:domain travel-domain)
  (:objects
    florence barcelona helsinki - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 - day
  )

  (:init
    (next day1 day2) (next day2 day3) (next day3 day4) (next day4 day5)
    (next day5 day6) (next day6 day7) (next day7 day8) (next day8 day9)
    (next day9 day10) (next day10 day11) (next day11 day12) (next day12 day13)
    (next day13 day14)

    (connected barcelona florence)
    (connected florence barcelona)
    (connected helsinki barcelona)
    (connected barcelona helsinki)

    (at barcelona day1)
  )

  (:goal (and
    (at barcelona day1)
    (at barcelona day2)
    (at barcelona day3)
    (at barcelona day8)
    (at helsinki day4)
    (at helsinki day5)
    (at helsinki day6)
    (at helsinki day7)
    (at florence day9)
    (at florence day10)
    (at florence day11)
    (at florence day12)
    (at florence day13)
    (at florence day14)
  ))
)