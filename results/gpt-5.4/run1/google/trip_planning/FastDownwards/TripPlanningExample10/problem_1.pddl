(define (problem tripplanningexample10_problem)
  (:domain tripplanningexample10)

  (:objects
    oslo dublin valencia - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 - day
  )

  (:init
    (at oslo)
    (current_day day1)

    (next_day day1 day2)
    (next_day day2 day3)
    (next_day day3 day4)
    (next_day day4 day5)
    (next_day day5 day6)
    (next_day day6 day7)
    (next_day day7 day8)
    (next_day day8 day9)

    (direct oslo dublin)
    (direct dublin oslo)
    (direct dublin valencia)
    (direct valencia dublin)

    (visited_on oslo day1)

    (valencia_window_day day5)
    (valencia_window_day day6)
    (valencia_window_day day7)
    (valencia_window_day day8)
    (valencia_window_day day9)
  )

  (:goal
    (and
      (current_day day9)

      (visited_on oslo day1)
      (visited_on oslo day2)
      (visited_on oslo day3)

      (visited_on dublin day4)
      (visited_on dublin day5)
      (visited_on dublin day6)

      (visited_on valencia day5)
      (visited_on valencia day6)
      (visited_on valencia day7)
      (visited_on valencia day8)
      (visited_on valencia day9)
    )
  )
)