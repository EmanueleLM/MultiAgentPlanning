(define (problem trip_planning_example3_problem)
  (:domain trip_planning_example3)

  (:objects
    berlin warsaw bucharest - city
    day1 day2 day3 day4 day5 day6 - day
  )

  (:init
    (at berlin)

    (direct_flight berlin warsaw)
    (direct_flight warsaw berlin)
    (direct_flight warsaw bucharest)
    (direct_flight bucharest warsaw)

    (current_day day1)
    (next_day day1 day2)
    (next_day day2 day3)
    (next_day day3 day4)
    (next_day day4 day5)
    (next_day day5 day6)

    (berlin_days_0)
    (warsaw_days_0)
    (bucharest_days_0)
  )

  (:goal
    (and
      (trip_done)
      (berlin_days_3)
      (warsaw_days_3)
      (bucharest_days_2)
      (met_friend)
      (at bucharest)
    )
  )
)