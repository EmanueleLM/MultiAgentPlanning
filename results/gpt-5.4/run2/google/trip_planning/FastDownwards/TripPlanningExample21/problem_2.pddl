(define (problem tripplanningexample21_problem)
  (:domain tripplanningexample21)

  (:objects
    mykonos vienna venice - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 - day
  )

  (:init
    (at mykonos)
    (current day1)

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

    (workshop_day day5)
    (workshop_day day6)
    (workshop_day day7)
    (workshop_day day8)
    (workshop_day day9)
    (workshop_day day10)
  )

  (:goal
    (and
      (current day11)
      (workshop_attended)

      (assigned day1 mykonos)
      (assigned day2 mykonos)

      (assigned day3 vienna)
      (assigned day4 vienna)
      (assigned day5 vienna)
      (assigned day6 vienna)

      (assigned day5 venice)
      (assigned day6 venice)
      (assigned day7 venice)
      (assigned day8 venice)
      (assigned day9 venice)
      (assigned day10 venice)
    )
  )
)