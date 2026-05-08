(define (problem tripplanningexample16_problem)
  (:domain tripplanningexample16)

  (:objects
    prague vienna porto - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 - day
  )

  (:init
    (direct vienna porto)
    (direct porto vienna)
    (direct prague vienna)
    (direct vienna prague)

    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)
    (next day5 day6)
    (next day6 day7)
    (next day7 day8)
    (next day8 day9)

    (workshop_window day1)
    (workshop_window day2)
    (workshop_window day3)

    (current_day day1)
    (at prague)
    (spent prague day1)
  )

  (:goal
    (and
      (current_day day9)
      (workshop_attended)
      (spent prague day1)
      (spent prague day2)
      (spent prague day3)
      (spent vienna day4)
      (spent vienna day5)
      (spent vienna day6)
      (spent porto day5)
      (spent porto day6)
      (spent porto day7)
      (spent porto day8)
      (spent porto day9)
    )
  )
)