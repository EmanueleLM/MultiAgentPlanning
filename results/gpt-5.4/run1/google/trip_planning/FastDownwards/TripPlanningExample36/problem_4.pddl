(define (problem tripplanningexample36_problem)
  (:domain tripplanningexample36)

  (:objects
    florence munich warsaw - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 - day
    s0 s1 s2 s3 s4 s5 s6 s7 - stay_count
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

    (next_stay s0 s1)
    (next_stay s1 s2)
    (next_stay s2 s3)
    (next_stay s3 s4)
    (next_stay s4 s5)
    (next_stay s5 s6)
    (next_stay s6 s7)

    (flight florence munich)
    (flight florence warsaw)
    (flight munich florence)
    (flight munich warsaw)

    (current_day day1)
    (at florence)

    (florence_stays s0)
    (munich_stays s0)
    (warsaw_stays s0)
  )

  (:goal
    (and
      (current_day day13)
      (used_day day1)
      (used_day day2)
      (used_day day3)
      (used_day day4)
      (used_day day5)
      (used_day day6)
      (used_day day7)
      (used_day day8)
      (used_day day9)
      (used_day day10)
      (used_day day11)
      (used_day day12)
      (used_day day13)
      (visited florence)
      (visited munich)
      (visited warsaw)
      (florence_stays s2)
      (munich_stays s6)
      (warsaw_stays s5)
    )
  )
)