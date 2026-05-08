(define (problem tripplanningexample18)
  (:domain european_trip_11_days)

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

    (friend_window day6)
    (friend_window day7)
    (friend_window day8)
    (friend_window day9)
    (friend_window day10)
    (friend_window day11)

    (current_day day1)
  )

  (:goal
    (and
      (current_day day11)
      (visited amsterdam)
      (visited vilnius)
      (visited bucharest)
      (met_friends)

      (in amsterdam day1)
      (in amsterdam day2)
      (in amsterdam day3)
      (in amsterdam day4)
      (in amsterdam day5)

      (in bucharest day6)
      (in bucharest day7)
      (in bucharest day8)
      (in bucharest day9)
      (in bucharest day10)
      (in bucharest day11)

      (in vilnius day10)
      (in vilnius day11)
    )
  )
)