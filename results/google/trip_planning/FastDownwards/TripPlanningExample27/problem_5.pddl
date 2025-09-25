(define (problem trip_problem)
  (:domain trip_domain)
  (:objects
    istanbul amsterdam santorini - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 - day
  )

  (:init
    ;; initial location (no start city specified in the human spec; using Istanbul as an explicit initial fact)
    (at istanbul day1)

    ;; day progression
    (next day1 day2) (next day2 day3) (next day3 day4) (next day4 day5)
    (next day5 day6) (next day6 day7) (next day7 day8) (next day8 day9)
    (next day9 day10) (next day10 day11) (next day11 day12) (next day12 day13)
    (next day13 day14)

    ;; available direct flights (bidirectional)
    (conn istanbul amsterdam)
    (conn amsterdam istanbul)
    (conn amsterdam santorini)
    (conn santorini amsterdam)

    ;; free days (day1 is already assigned in init, so not free)
    (free day2) (free day3) (free day4) (free day5) (free day6) (free day7)
    (free day8) (free day9) (free day10) (free day11) (free day12) (free day13) (free day14)
  )

  (:goal
    (and
      ;; Istanbul: 6 days (human specification)
      (at istanbul day1)
      (at istanbul day2)
      (at istanbul day3)
      (at istanbul day4)
      (at istanbul day5)
      (at istanbul day6)

      ;; Amsterdam: 7 days (human specification)
      (at amsterdam day7)
      (at amsterdam day8)
      (at amsterdam day9)
      (at amsterdam day10)
      (at amsterdam day11)
      (at amsterdam day12)
      (at amsterdam day13)

      ;; Santorini: 3 days and relatives visit between day12 and day14 inclusive (human specification)
      (at santorini day12)
      (at santorini day13)
      (at santorini day14)
    )
  )
)