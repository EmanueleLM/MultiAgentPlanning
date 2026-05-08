(define (problem european_trip_6_days_instance_problem)
  (:domain european_trip_6_days_instance)

  (:objects
    berlin warsaw bucharest - city
    day1 day2 day3 day4 day5 day6 - day
  )

  (:init
    (current_day day1)
    (at berlin)

    (next_day day1 day2)
    (next_day day2 day3)
    (next_day day3 day4)
    (next_day day4 day5)
    (next_day day5 day6)
    (last_day day6)

    (direct_flight berlin warsaw)
    (direct_flight warsaw berlin)
    (direct_flight warsaw bucharest)
    (direct_flight bucharest warsaw)

    (b_count_0)
    (be_count_0)
    (w_count_0)
  )

  (:goal
    (and
      (finished)
      (b_count_2)
      (be_count_3)
      (w_count_3)
      (met_friend)
    )
  )
)