(define (problem trip_planning_example43_problem)
  (:domain trip_planning_example43)

  (:objects)

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
      (visited venice day1)
      (visited venice day2)
      (visited venice day3)
      (visited venice day4)
      (visited porto day7)
      (visited porto day8)
      (visited porto day9)
      (visited porto day10)
      (visited dublin day5)
      (visited dublin day6)
      (meeting_done)
      (current_day day10)
    )
  )
)