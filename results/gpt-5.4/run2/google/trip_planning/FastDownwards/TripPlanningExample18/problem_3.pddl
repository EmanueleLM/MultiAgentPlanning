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

    (friends_window day6)
    (friends_window day7)
    (friends_window day8)
    (friends_window day9)
    (friends_window day10)
    (friends_window day11)

    (current_day day1)
  )

  (:goal
    (and
      (current_day day11)
      (met_friends)
      (visited day1 vilnius)
      (visited day2 vilnius)
      (visited day3 amsterdam)
      (visited day4 amsterdam)
      (visited day5 amsterdam)
      (visited day6 amsterdam)
      (visited day7 amsterdam)
      (visited day8 bucharest)
      (visited day9 bucharest)
      (visited day10 bucharest)
      (visited day11 bucharest)
    )
  )
)