(define (problem tripplanningexample33)
  (:domain european_trip_13_days_instance)

  (:objects
    barcelona krakow rome - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 - day
  )

  (:init
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
      (today day13)

      (in barcelona day1)
      (in barcelona day2)
      (in barcelona day3)
      (in barcelona day4)
      (in barcelona day5)
      (in barcelona day6)
      (in barcelona day7)

      (in rome day8)
      (in rome day9)
      (in rome day10)
      (in rome day11)

      (in krakow day10)
      (in krakow day11)
      (in krakow day12)
      (in krakow day13)

      (met_friend)
    )
  )
)