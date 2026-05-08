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
      (finished)
      (met_friend)

      (visited_on barcelona day1)
      (visited_on barcelona day2)
      (visited_on barcelona day3)
      (visited_on barcelona day4)

      (visited_on rome day5)
      (visited_on rome day6)
      (visited_on rome day7)
      (visited_on rome day8)

      (visited_on barcelona day9)
      (visited_on barcelona day10)
      (visited_on barcelona day11)

      (visited_on krakow day10)
      (visited_on krakow day11)
      (visited_on krakow day12)
      (visited_on krakow day13)
    )
  )
)