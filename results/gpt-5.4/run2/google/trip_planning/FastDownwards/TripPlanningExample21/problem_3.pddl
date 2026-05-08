(define (problem tripplanningexample21_problem)
  (:domain tripplanningexample21)

  (:objects
    mykonos vienna venice - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 - day
  )

  (:init
    (at mykonos)
    (current_day day1)

    (direct mykonos vienna)
    (direct vienna mykonos)
    (direct vienna venice)
    (direct venice vienna)

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

    (workshop_window day5)
    (workshop_window day6)
    (workshop_window day7)
    (workshop_window day8)
    (workshop_window day9)
    (workshop_window day10)
  )

  (:goal
    (and
      (current_day day11)
      (workshop_attended)

      (spent day1 mykonos)
      (spent day2 mykonos)

      (spent day3 vienna)
      (spent day4 vienna)
      (spent day5 vienna)
      (spent day6 vienna)

      (spent day7 venice)
      (spent day8 venice)
      (spent day9 venice)
      (spent day10 venice)
      (spent day5 venice)
      (spent day6 venice)
    )
  )
)