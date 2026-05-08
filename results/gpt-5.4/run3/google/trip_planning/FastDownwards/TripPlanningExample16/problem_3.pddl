(define (problem trip_planning_example16_problem)
  (:domain trip_planning_example16)

  (:objects
    prague vienna porto - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 - day
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
    (next day9 day10)

    (required_workshop_day day1)
    (required_workshop_day day2)
    (required_workshop_day day3)

    (current day1)
    (at prague)
  )

  (:goal
    (and
      (total_complete)
      (workshop_done)

      (visited_day prague day1)
      (visited_day prague day2)
      (visited_day prague day3)

      (visited_day vienna day4)
      (visited_day vienna day5)
      (visited_day vienna day6)

      (visited_day porto day7)
      (visited_day porto day8)
      (visited_day porto day9)
      (visited_day porto day10)
    )
  )
)