(define (problem trip_planning_example18_problem)
  (:domain trip_planning_example18)

  (:objects
    amsterdam vilnius bucharest - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 - day
  )

  (:init
    (direct amsterdam bucharest)
    (direct bucharest amsterdam)
    (direct vilnius amsterdam)
    (direct amsterdam vilnius)

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

    (current_day day1)
  )

  (:goal
    (and
      (current_day day11)

      (visited vilnius day1)
      (visited vilnius day2)

      (visited amsterdam day3)
      (visited amsterdam day4)
      (visited amsterdam day5)
      (visited amsterdam day6)
      (visited amsterdam day7)

      (visited bucharest day6)
      (visited bucharest day7)
      (visited bucharest day8)
      (visited bucharest day9)
      (visited bucharest day10)
      (visited bucharest day11)

      (friends_met)
    )
  )
)