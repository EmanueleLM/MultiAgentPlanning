(define (problem trip-planning-problem)
  (:domain trip-planning)
  (:objects
    seville munich tallinn - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 - day
  )
  (:init
    (current_day day1)
    (not_started)

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

    (connected seville munich)
    (connected munich seville)
    (connected munich tallinn)
    (connected tallinn munich)

    (seville_days_0)
    (munich_days_0)
    (tallinn_days_0)
  )

  (:goal
    (and
      (current_day day12)
      (visited tallinn day11)
      (visited tallinn day12)
      (seville_days_7)
      (munich_days_3)
      (tallinn_days_2)
    )
  )
)