(define (problem trip_planning_example28_problem)
  (:domain trip_planning_example28)

  (:objects
    venice florence zurich - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 - day
  )

  (:init
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

    (current_day day1)
    (last_day day12)

    (direct venice zurich)
    (direct zurich venice)
    (direct zurich florence)

    (venice_0)
    (florence_0)
    (zurich_0)

    (or_dummy_not_used)
  )

  (:goal
    (and
      (trip_done)
    )
  )
)