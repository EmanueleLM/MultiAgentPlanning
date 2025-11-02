(define (problem schedule-3-city-trip)
  (:domain multiagent-travel)
  (:objects
    manchester bucharest lyon - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 day15 day16 day17 day18 - day
  )
  (:init
    (at manchester)
    (day-next day1 day2) (day-next day2 day3) (day-next day3 day4)
    (day-next day4 day5) (day-next day5 day6) (day-next day6 day7)
    (day-next day7 day8) (day-next day8 day9) (day-next day9 day10)
    (day-next day10 day11) (day-next day11 day12) (day-next day12 day13)
    (day-next day13 day14) (day-next day14 day15) (day-next day15 day16)
    (day-next day16 day17) (day-next day17 day18)
    (day-now day1)
  )
  (:goal (and
    (visited manchester day1) (visited manchester day2) (visited manchester day3)
    (visited manchester day4) (visited manchester day5) (visited manchester day6)
    (visited manchester day7)

    (visited bucharest day8) (visited bucharest day9) (visited bucharest day10)
    (visited bucharest day11) (visited bucharest day12) (visited bucharest day13)
    (visited bucharest day14)

    (visited lyon day13) (visited lyon day14) (visited lyon day15)
    (visited lyon day16) (visited lyon day17)
  ))
)