(define (problem trip_planning_example3_problem)
  (:domain trip_planning_example3)

  (:objects
    berlin warsaw bucharest - city
    day1 day2 day3 day4 day5 day6 day7 - day
  )

  (:init
    (at berlin)

    (direct berlin warsaw)
    (direct warsaw berlin)
    (direct warsaw bucharest)
    (direct bucharest warsaw)

    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)
    (next day5 day6)
    (next day6 day7)

    (current_day day1)

    (friend_window day5)
    (friend_window day6)
  )

  (:goal
    (and
      (current_day day7)
      (at bucharest)

      (visited day1 berlin)
      (visited day2 berlin)
      (visited day3 berlin)

      (visited day4 warsaw)
      (visited day5 warsaw)
      (visited day6 warsaw)

      (visited day5 bucharest)
      (visited day6 bucharest)

      (met_friend)
    )
  )
)