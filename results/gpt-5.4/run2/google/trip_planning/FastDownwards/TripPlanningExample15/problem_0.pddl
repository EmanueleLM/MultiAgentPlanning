(define (problem european_trip_11_days_instance_problem)
  (:domain european_trip_11_days_instance)

  (:objects
    berlin porto krakow - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 - day
  )

  (:init
    (start_pending)

    (next_day day1 day2)
    (next_day day2 day3)
    (next_day day3 day4)
    (next_day day4 day5)
    (next_day day5 day6)
    (next_day day6 day7)
    (next_day day7 day8)
    (next_day day8 day9)
    (next_day day9 day10)
    (next_day day10 day11)

    (direct_flight berlin porto)
    (direct_flight porto berlin)
    (direct_flight berlin krakow)
    (direct_flight krakow berlin)
  )

  (:goal
    (and
      (current_day day11)

      (at porto day10)
      (at porto day11)

      (at berlin day1)
      (at berlin day2)
      (at berlin day3)
      (at berlin day4)
      (at berlin day5)
      (at berlin day6)

      (at porto day7)
      (at porto day8)

      (at krakow day7)
      (at krakow day8)
      (at krakow day9)
      (at krakow day10)
      (at krakow day11)
    )
  )
)