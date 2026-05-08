(define (problem trip_planning_example16_problem)
  (:domain trip_planning_example16)

  (:objects
    prague vienna porto - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 - day
  )

  (:init
    (in prague)

    (current day1)
    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)
    (next day5 day6)
    (next day6 day7)
    (next day7 day8)
    (next day8 day9)
    (last day9)

    (workshop_day day1)
    (workshop_day day2)
    (workshop_day day3)

    (direct prague vienna)
    (direct vienna prague)
    (direct vienna porto)
    (direct porto vienna)

    (need_prague_3)
    (need_vienna_3)
    (need_porto_5)
  )

  (:goal
    (and
      (workshop_attended)
      (done_prague)
      (done_vienna)
      (done_porto)
      (current day9)
      (in porto)
    )
  )
)