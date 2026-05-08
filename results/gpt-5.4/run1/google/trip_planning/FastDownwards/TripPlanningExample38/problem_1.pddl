(define (problem trip_planning_example38_problem)
  (:domain trip_planning_example38)

  (:objects
    geneva madrid venice - city
    day1 day2 day3 day4 day5 - day
  )

  (:init
    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)

    (direct geneva madrid)
    (direct madrid geneva)
    (direct madrid venice)
    (direct venice madrid)

    ; choose a feasible start consistent with the stated city-day totals
    (at day1 geneva)
    (visited geneva)
  )

  (:goal
    (and
      (visited geneva)
      (visited madrid)
      (visited venice)

      (at day2 geneva)

      (at day3 madrid)

      (at day4 venice)
      (at day5 venice)
    )
  )
)