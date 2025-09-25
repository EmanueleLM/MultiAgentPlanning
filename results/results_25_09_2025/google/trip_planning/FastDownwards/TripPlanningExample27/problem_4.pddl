(define (problem trip_problem)
  (:domain trip_domain)
  (:objects
    istanbul amsterdam santorini
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14
  )

  (:init
    (at istanbul day1)

    (next day1 day2) (next day2 day3) (next day3 day4) (next day4 day5)
    (next day5 day6) (next day6 day7) (next day7 day8) (next day8 day9)
    (next day9 day10) (next day10 day11) (next day11 day12) (next day12 day13)
    (next day13 day14)

    (conn istanbul amsterdam)
    (conn amsterdam istanbul)
    (conn amsterdam santorini)
    (conn santorini amsterdam)
  )

  (:goal
    (and
      (at istanbul day1)
      (at istanbul day2)
      (at istanbul day3)
      (at istanbul day4)
      (at istanbul day5)

      (at amsterdam day6)
      (at amsterdam day7)
      (at amsterdam day8)
      (at amsterdam day9)
      (at amsterdam day10)
      (at amsterdam day11)

      (at santorini day12)
      (at santorini day13)
      (at santorini day14)
    )
  )
)