(define (problem european_trip_9_days_instance_problem)
  (:domain european_trip_9_days_instance)

  (:objects
    frankfurt florence valencia - city

    day1 day2 day3 day4 day5 day6 day7 day8 day9 - day

    c0 c1 c2 c3 c4 c5 c6 c7 c8 c9 - count
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

    (direct frankfurt florence)
    (direct florence frankfurt)
    (direct frankfurt valencia)
    (direct valencia frankfurt)

    (count_at c0)
    (count_next c0 c1)
    (count_next c1 c2)
    (count_next c2 c3)
    (count_next c3 c4)
    (count_next c4 c5)
    (count_next c5 c6)
    (count_next c6 c7)
    (count_next c7 c8)
    (count_next c8 c9)
  )

  (:goal
    (and
      (used_day day1)
      (used_day day2)
      (used_day day3)
      (used_day day4)
      (used_day day5)
      (used_day day6)
      (used_day day7)
      (used_day day8)
      (used_day day9)

      (at valencia day1)
      (at valencia day2)

      (at florence day6)
      (at florence day7)
      (at florence day8)
      (at florence day9)

      (at frankfurt day1)
      (at frankfurt day2)
      (at frankfurt day3)
      (at frankfurt day4)
      (at frankfurt day5)

      (count_at c9)
      (valencia_window_met)
    )
  )
)