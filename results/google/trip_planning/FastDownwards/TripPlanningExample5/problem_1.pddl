(define (problem trip16-problem)
  (:domain trip16)
  (:init
    (at porto day1)
    (next day1 day2) (next day2 day3) (next day3 day4) (next day4 day5)
    (next day5 day6) (next day6 day7) (next day7 day8) (next day8 day9)
    (next day9 day10) (next day10 day11) (next day11 day12) (next day12 day13)
    (next day13 day14) (next day14 day15) (next day15 day16)
  )
  (:goal
    (and
      (attended day12)
      (attended day16)
      (at dubrovnik day16)
    )
  )
)