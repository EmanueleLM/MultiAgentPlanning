(define (problem trip_planning_example28_problem)
  (:domain trip_planning_example28)

  (:objects
    venice florence zurich - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 - day
    c0 c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 c12 - count
  )

  (:init
    (next_day day1 day2)
    (next_day day2 day3)
    (next_day day3 day4)
    (next_day day4 day5)
    (next_day day5 day6)
    (next_day day6 day7)
    (next_day day7 day8)
    (next_day day8 day9)
    (next_day day9 day10)
    (next_day day10 day11)
    (next_day day11 day12)

    (count_next c0 c1)
    (count_next c1 c2)
    (count_next c2 c3)
    (count_next c3 c4)
    (count_next c4 c5)
    (count_next c5 c6)
    (count_next c6 c7)
    (count_next c7 c8)
    (count_next c8 c9)
    (count_next c9 c10)
    (count_next c10 c11)
    (count_next c11 c12)

    (current_day day1)
    (last_day day12)

    (direct venice zurich)
    (direct zurich venice)
    (direct zurich florence)

    (venice_days c0)
    (florence_days c0)
    (zurich_days c0)
  )

  (:goal
    (and
      (trip_done)
    )
  )
)