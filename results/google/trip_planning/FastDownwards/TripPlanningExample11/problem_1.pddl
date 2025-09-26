(define (problem trip-problem)
  (:domain trip-domain)

  (:objects
    vienna vilnius valencia - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 day15 - day
  )

  (:init
    (succ day1 day2) (succ day2 day3) (succ day3 day4) (succ day4 day5)
    (succ day5 day6) (succ day6 day7) (succ day7 day8) (succ day8 day9)
    (succ day9 day10) (succ day10 day11) (succ day11 day12) (succ day12 day13)
    (succ day13 day14) (succ day14 day15)

    (conn vienna valencia) (conn valencia vienna)
    (conn vienna vilnius) (conn vilnius vienna)

    (at vienna day1)
  )

  (:goal (and
    (at vienna day1) (at vienna day2) (at vienna day3) (at vienna day4) (at vienna day5)
    (at vilnius day6) (at vilnius day7) (at vilnius day8) (at vilnius day9) (at vilnius day10)
    (at valencia day9) (at valencia day10) (at valencia day11) (at valencia day12) (at valencia day13) (at valencia day14) (at valencia day15)
  ))
)