(define (problem tripplanningexample33)
  (:domain european_trip_13_days_instance)

  (:objects
    barcelona krakow rome - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 - day
  )

  (:init
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

    (meeting_day day10)
    (meeting_day day11)
    (meeting_day day12)
    (meeting_day day13)
  )

  (:goal
    (and
      (current_day day13)

      (visited barcelona)
      (visited krakow)
      (visited rome)

      (at barcelona day1)
      (at barcelona day2)
      (at barcelona day3)
      (at barcelona day4)
      (at barcelona day5)
      (at barcelona day6)
      (at barcelona day7)

      (at rome day8)
      (at rome day9)
      (at rome day10)
      (at rome day11)

      (at krakow day10)
      (at krakow day11)
      (at krakow day12)
      (at krakow day13)

      (met_friend)
    )
  )
)