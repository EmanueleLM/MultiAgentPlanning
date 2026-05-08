(define (problem tripplanningexample3_problem)
  (:domain tripplanningexample3)

  (:objects
    berlin warsaw bucharest - city
    day1 day2 day3 day4 day5 day6 - day
  )

  (:init
    (direct berlin warsaw)
    (direct warsaw berlin)
    (direct warsaw bucharest)
    (direct bucharest warsaw)

    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)
    (next day5 day6)

    (current_day day1)

    (need_berlin_3)
    (need_warsaw_3)
    (need_bucharest_2)

    (friend_window day5)
    (friend_window day6)
  )

  (:goal
    (and
      (visited_day day6)
      (need_berlin_0)
      (need_warsaw_0)
      (need_bucharest_0)
      (met_friend)
    )
  )
)