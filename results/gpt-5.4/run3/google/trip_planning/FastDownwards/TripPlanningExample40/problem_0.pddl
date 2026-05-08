(define (problem european_trip_8_days_instance_problem)
  (:domain european_trip_8_days_instance)

  (:objects
    oslo reykjavik manchester - city
    day1 day2 day3 day4 day5 day6 day7 day8 - day
  )

  (:init
    (next_day day1 day2)
    (next_day day2 day3)
    (next_day day3 day4)
    (next_day day4 day5)
    (next_day day5 day6)
    (next_day day6 day7)
    (next_day day7 day8)

    (direct_flight oslo reykjavik)
    (direct_flight reykjavik oslo)
    (direct_flight manchester oslo)
    (direct_flight oslo manchester)

    (current_day day1)
  )

  (:goal
    (and
      (assigned day1)
      (assigned day2)
      (assigned day3)
      (assigned day4)
      (assigned day5)
      (assigned day6)
      (assigned day7)
      (assigned day8)

      (at day1 manchester)
      (at day2 manchester)

      (at day3 reykjavik)
      (at day4 reykjavik)

      (at day5 oslo)
      (at day6 oslo)
      (at day7 oslo)
      (at day8 oslo)
      (at day1 oslo)
      (at day2 oslo)
    )
  )
)