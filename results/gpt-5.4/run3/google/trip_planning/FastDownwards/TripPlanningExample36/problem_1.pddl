(define (problem trip_planning_example36_instance)
  (:domain trip_planning_example36)

  (:objects
    florence munich warsaw - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 day_12 day_13 - day
  )

  (:init
    (current_day day_1)

    (next day_1 day_2)
    (next day_2 day_3)
    (next day_3 day_4)
    (next day_4 day_5)
    (next day_5 day_6)
    (next day_6 day_7)
    (next day_7 day_8)
    (next day_8 day_9)
    (next day_9 day_10)
    (next day_10 day_11)
    (next day_11 day_12)
    (next day_12 day_13)

    (direct florence munich)
    (direct munich florence)
    (direct florence warsaw)
    (direct warsaw florence)
    (direct munich warsaw)
    (direct warsaw munich)

    (florence_count_0)
    (munich_count_0)
    (warsaw_count_0)
  )

  (:goal
    (and
      (current_day day_13)
      (visited florence)
      (visited munich)
      (visited warsaw)
      (florence_count_2)
      (munich_count_6)
      (warsaw_count_7)
    )
  )
)