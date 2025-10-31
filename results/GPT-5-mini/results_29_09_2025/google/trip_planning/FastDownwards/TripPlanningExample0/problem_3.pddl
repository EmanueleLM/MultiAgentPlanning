(define (problem TripPlanningExample0)
  (:domain trip-planning)
  (:objects
    florence barcelona helsinki - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 - day
    c1 c2 c3 c4 c5 c6 - count
  )
  (:init
    (next day1 day2) (next day2 day3) (next day3 day4) (next day4 day5) (next day5 day6) (next day6 day7)
    (next day7 day8) (next day8 day9) (next day9 day10) (next day10 day11) (next day11 day12) (next day12 day13) (next day13 day14)
    (connected barcelona florence) (connected florence barcelona)
    (connected helsinki barcelona) (connected barcelona helsinki)
    (at helsinki day1)
    (desired florence c6) (desired barcelona c5) (desired helsinki c5)
    (allocated florence c6) (allocated barcelona c5) (allocated helsinki c3)
  )
  (:goal (and
    (at helsinki day1) (at helsinki day2) (at helsinki day3)
    (at barcelona day4) (at barcelona day5) (at barcelona day6) (at barcelona day7) (at barcelona day8)
    (at florence day9) (at florence day10) (at florence day11) (at florence day12) (at florence day13) (at florence day14)
  ))
)