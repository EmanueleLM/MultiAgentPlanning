(define (problem trip_planning_example43_problem)
  (:domain trip_planning_example43)

  (:objects
    dublin porto venice - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 - day
  )

  (:init
    (direct dublin porto)
    (direct porto dublin)
    (direct venice dublin)
    (direct dublin venice)

    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)
    (next day5 day6)
    (next day6 day7)
    (next day7 day8)
    (next day8 day9)
    (next day9 day10)

    (current_day day1)
  )

  (:goal
    (and
      (visited_day venice day1)
      (visited_day venice day2)
      (visited_day venice day3)
      (visited_day venice day4)

      (visited_day porto day5)
      (visited_day porto day6)
      (visited_day porto day7)
      (visited_day porto day8)

      (visited_day dublin day7)
      (visited_day dublin day8)
      (visited_day dublin day9)
      (visited_day dublin day10)

      (meeting_done)
    )
  )
)