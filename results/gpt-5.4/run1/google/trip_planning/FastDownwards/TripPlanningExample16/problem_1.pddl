(define (problem trip_planning_example16_problem)
  (:domain trip_planning_example16)

  (:objects
    prague vienna porto - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 - day
  )

  (:init
    (at prague)

    (current_day day1)
    (next_day day1 day2)
    (next_day day2 day3)
    (next_day day3 day4)
    (next_day day4 day5)
    (next_day day5 day6)
    (next_day day6 day7)
    (next_day day7 day8)
    (next_day day8 day9)
    (last_day day9)

    (workshop_day day1)
    (workshop_day day2)
    (workshop_day day3)

    (direct_flight vienna porto)
    (direct_flight porto vienna)
    (direct_flight prague vienna)
    (direct_flight vienna prague)

    (prague_days_0)
    (vienna_days_0)
    (porto_days_0)
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
      (attended_workshop)
      (prague_days_3)
      (vienna_days_3)
      (porto_days_5)
    )
  )
)