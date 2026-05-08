(define (problem tripplanningexample27_problem)
  (:domain tripplanningexample27)

  (:objects
    amsterdam santorini istanbul - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 - day
  )

  (:init
    (at amsterdam day1)

    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)
    (next day5 day6)
    (next day6 day7)
    (next day7 day8)
    (next day8 day9)
    (next day9 day10)
    (next day10 day11)
    (next day11 day12)
    (next day12 day13)
    (next day13 day14)

    (direct amsterdam santorini)
    (direct santorini amsterdam)
    (direct istanbul amsterdam)
    (direct amsterdam istanbul)

    (travel_day day7)
    (travel_day day11)
  )

  (:goal
    (and
      (at santorini day14)

      (at amsterdam day2)
      (at amsterdam day3)
      (at amsterdam day4)
      (at amsterdam day5)
      (at amsterdam day6)
      (at amsterdam day7)
      (at amsterdam day8)

      (at istanbul day9)
      (at istanbul day10)
      (at istanbul day11)
      (at istanbul day12)

      (at santorini day12)
      (at santorini day13)
      (at santorini day14)
    )
  )
)