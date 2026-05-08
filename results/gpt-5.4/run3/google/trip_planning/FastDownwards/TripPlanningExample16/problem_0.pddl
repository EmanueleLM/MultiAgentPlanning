(define (problem european_trip_9_days_instance_problem)
  (:domain european_trip_9_days_instance)

  (:objects
    prague vienna porto - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 - day
  )

  (:init
    (next_day d1 d2)
    (next_day d2 d3)
    (next_day d3 d4)
    (next_day d4 d5)
    (next_day d5 d6)
    (next_day d6 d7)
    (next_day d7 d8)
    (next_day d8 d9)
    (next_day d9 d10)

    (direct vienna porto)
    (direct porto vienna)
    (direct prague vienna)
    (direct vienna prague)
  )

  (:goal
    (and
      (prague_count_3)
      (vienna_count_3)
      (porto_count_5)
      (workshop_attended)
      (at prague d10)
      (at vienna d10)
      (at porto d10)
    )
  )
)