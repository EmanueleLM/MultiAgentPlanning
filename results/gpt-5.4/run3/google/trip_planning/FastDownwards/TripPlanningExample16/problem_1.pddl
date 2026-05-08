(define (problem trip_planning_example16_problem)
  (:domain trip_planning_example16)

  (:objects
    prague vienna porto - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 - day
  )

  (:init
    (direct vienna porto)
    (direct porto vienna)
    (direct prague vienna)
    (direct vienna prague)

    (next_day d1 d2)
    (next_day d2 d3)
    (next_day d3 d4)
    (next_day d4 d5)
    (next_day d5 d6)
    (next_day d6 d7)
    (next_day d7 d8)
    (next_day d8 d9)
    (next_day d9 d10)

    (current_day d1)
    (at prague)

    (day_count_0)
    (prague_days_0)
    (vienna_days_0)
    (porto_days_0)
  )

  (:goal
    (and
      (current_day d10)
      (day_count_9)
      (prague_days_3)
      (vienna_days_3)
      (porto_days_5)
      (workshop_attended)
    )
  )
)