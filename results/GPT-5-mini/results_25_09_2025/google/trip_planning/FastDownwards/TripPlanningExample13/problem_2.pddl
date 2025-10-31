(define (problem schedule-3-city-trip)
  (:domain multiagent-travel)
  (:objects
    manchester bucharest lyon - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 day15 day16 day17 day18 - day
  )
  (:init
    ;; flight connectivity (direct flights only)
    (connected manchester bucharest)
    (connected bucharest manchester)
    (connected bucharest lyon)
    (connected lyon bucharest)

    ;; start location (not specified in human spec; kept as in initial attempt)
    (at manchester)

    ;; day progression (day18 is sentinel to allow advancing from day17)
    (day-next day1 day2) (day-next day2 day3) (day-next day3 day4)
    (day-next day4 day5) (day-next day5 day6) (day-next day6 day7)
    (day-next day7 day8) (day-next day8 day9) (day-next day9 day10)
    (day-next day10 day11) (day-next day11 day12) (day-next day12 day13)
    (day-next day13 day14) (day-next day14 day15) (day-next day15 day16)
    (day-next day16 day17) (day-next day17 day18)

    (day-now day1)

    ;; numeric function initializations
    (= (visited-count manchester) 0)
    (= (visited-count bucharest) 0)
    (= (visited-count lyon) 0)
    (= (total-days) 0)
  )
  (:goal (and
    ;; private requirements: exact day counts per city
    (= (visited-count manchester) 7)
    (= (visited-count bucharest) 7)
    (= (visited-count lyon) 5)

    ;; Lyon relatives requirement: be in Lyon on days 13..17
    (visited lyon day13)
    (visited lyon day14)
    (visited lyon day15)
    (visited lyon day16)
    (visited lyon day17)
  ))
)