(define (problem tripplanningexample36_problem)
  (:domain tripplanningexample36)

  (:objects
    florence munich warsaw - city

    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 - day

    c0 c1 c2 c3 c4 c5 c6 c7 - count
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
    (next_day day12 day13)

    (next_count c0 c1)
    (next_count c1 c2)
    (next_count c2 c3)
    (next_count c3 c4)
    (next_count c4 c5)
    (next_count c5 c6)
    (next_count c6 c7)

    (direct_flight florence munich)
    (direct_flight florence warsaw)
    (direct_flight munich florence)
    (direct_flight munich warsaw)

    (current_day day1)

    (at florence)

    (florence_days c0)
    (munich_days c0)
    (warsaw_days c0)
  )

  (:goal
    (and
      (current_day day13)
      (day_used day1)
      (day_used day2)
      (day_used day3)
      (day_used day4)
      (day_used day5)
      (day_used day6)
      (day_used day7)
      (day_used day8)
      (day_used day9)
      (day_used day10)
      (day_used day11)
      (day_used day12)
      (day_used day13)

      (visited florence)
      (visited munich)
      (visited warsaw)

      (florence_days c2)
      (munich_days c6)
      (warsaw_days c7)
    )
  )
)