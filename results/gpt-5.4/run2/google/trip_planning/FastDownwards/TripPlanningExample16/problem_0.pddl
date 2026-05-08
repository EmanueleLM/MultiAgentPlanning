(define (problem european_trip_9_days_instance_problem)
  (:domain european_trip_9_days_instance)

  (:objects
    prague vienna porto - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 - day
  )

  (:init
    (connected vienna porto)
    (connected porto vienna)
    (connected prague vienna)
    (connected vienna prague)

    (next_day day_1 day_2)
    (next_day day_2 day_3)
    (next_day day_3 day_4)
    (next_day day_4 day_5)
    (next_day day_5 day_6)
    (next_day day_6 day_7)
    (next_day day_7 day_8)
    (next_day day_8 day_9)
  )

  (:goal
    (and
      (assigned day_1)
      (assigned day_2)
      (assigned day_3)
      (assigned day_4)
      (assigned day_5)
      (assigned day_6)
      (assigned day_7)
      (assigned day_8)
      (assigned day_9)

      (workshop_attended)

      (at prague day_1)
      (at prague day_2)
      (at prague day_3)

      (at vienna day_4)
      (at vienna day_5)
      (at vienna day_6)

      (at porto day_5)
      (at porto day_6)
      (at porto day_7)
      (at porto day_8)
      (at porto day_9)
    )
  )
)