(define (problem europe_trip_7_days_instance_problem)
  (:domain europe_trip_7_days_instance)

  (:objects
    paris istanbul salzburg - city
    day1 day2 day3 day4 day5 day6 day7 - day
  )

  (:init
    (direct paris istanbul)
    (direct istanbul paris)
    (direct istanbul salzburg)
    (direct salzburg istanbul)

    (next_day day1 day2)
    (next_day day2 day3)
    (next_day day3 day4)
    (next_day day4 day5)
    (next_day day5 day6)
    (next_day day6 day7)

    (at paris day1)
    (visited paris)
  )

  (:goal
    (and
      (at paris day1)
      (at paris day2)

      (at istanbul day3)
      (at istanbul day4)

      (at salzburg day3)
      (at salzburg day4)
      (at salzburg day5)
      (at salzburg day6)
      (at salzburg day7)

      (visited paris)
      (visited istanbul)
      (visited salzburg)
    )
  )
)