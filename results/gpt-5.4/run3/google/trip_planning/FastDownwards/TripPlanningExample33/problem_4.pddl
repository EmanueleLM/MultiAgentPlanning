(define (problem tripplanningexample33_problem)
  (:domain tripplanningexample33_domain)

  (:objects
    barcelona krakow rome - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 - day
  )

  (:init
    (current_day day1)

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

    (direct barcelona krakow)
    (direct krakow barcelona)
    (direct rome barcelona)
    (direct barcelona rome)

    (friend_window day10)
    (friend_window day11)
    (friend_window day12)
    (friend_window day13)
  )

  (:goal
    (and
      (current_day day13)
      (visited barcelona)
      (visited krakow)
      (visited rome)

      (stay_assigned barcelona day1)
      (stay_assigned barcelona day2)
      (stay_assigned barcelona day3)
      (stay_assigned barcelona day4)
      (stay_assigned barcelona day5)
      (stay_assigned barcelona day6)
      (stay_assigned barcelona day7)

      (stay_assigned rome day8)
      (stay_assigned rome day9)
      (stay_assigned rome day10)
      (stay_assigned rome day11)

      (stay_assigned krakow day10)
      (stay_assigned krakow day11)
      (stay_assigned krakow day12)
      (stay_assigned krakow day13)

      (met_friend)
    )
  )
)