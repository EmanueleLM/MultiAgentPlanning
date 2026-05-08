(define (problem tripplanningexample27_problem)
  (:domain tripplanningexample27)

  (:objects
    amsterdam santorini istanbul - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 - day
  )

  (:init
    (at amsterdam)
    (today day1)

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

    (flight amsterdam santorini)
    (flight santorini amsterdam)
    (flight amsterdam istanbul)
    (flight istanbul amsterdam)

    (stay_required amsterdam day1)
    (stay_required amsterdam day2)
    (stay_required amsterdam day3)
    (stay_required amsterdam day4)
    (stay_required amsterdam day5)
    (stay_required amsterdam day6)
    (stay_required amsterdam day7)

    (stay_required istanbul day8)
    (stay_required istanbul day9)
    (stay_required istanbul day10)
    (stay_required istanbul day11)
    (stay_required istanbul day12)
    (stay_required istanbul day13)

    (stay_required santorini day12)
    (stay_required santorini day13)
    (stay_required santorini day14)

    (relative_visit_window day12)
    (relative_visit_window day13)
    (relative_visit_window day14)
  )

  (:goal
    (and
      (today day14)
      (at santorini)
      (visited_relatives)
    )
  )
)