(define (problem trip_planning_example38_problem)
  (:domain trip_planning_example38)

  (:objects
    geneva madrid venice - city
    day_1 day_2 day_3 day_4 day_5 - day
  )

  (:init
    (direct geneva madrid)
    (direct madrid geneva)
    (direct madrid venice)
    (direct venice madrid)

    (next_day day_1 day_2)
    (next_day day_2 day_3)
    (next_day day_3 day_4)
    (next_day day_4 day_5)

    (current_day day_1)
    (at geneva)
    (visited geneva)
  )

  (:goal
    (and
      (spent day_1 geneva)
      (spent day_2 geneva)
      (spent day_3 madrid)
      (spent day_4 venice)
      (spent day_5 venice)
      (visited geneva)
      (visited madrid)
      (visited venice)
    )
  )
)