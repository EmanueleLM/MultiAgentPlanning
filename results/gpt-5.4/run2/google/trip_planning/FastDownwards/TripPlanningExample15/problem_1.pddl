(define (problem tripplanningexample15)
  (:domain european_trip_11_days_instance)

  (:objects
    berlin porto krakow - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 - day
  )

  (:init
    (direct_flight berlin porto)
    (direct_flight porto berlin)
    (direct_flight berlin krakow)
    (direct_flight krakow berlin)

    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)
    (next day5 day6)
    (next day6 day7)
    (next day7 day8)
    (next day8 day9)
    (next day9 day10)
    (next day10 day11)
  )

  (:goal
    (and
      (at porto day10)
      (at porto day11)

      (or
        (and
          (at berlin day1)
          (at berlin day2)
          (at berlin day3)
          (at berlin day4)
          (at berlin day5)
          (at berlin day6)
          (at krakow day7)
          (at krakow day8)
          (at krakow day9)
          (at porto day10)
          (at porto day11))
        (and
          (at krakow day1)
          (at krakow day2)
          (at krakow day3)
          (at krakow day4)
          (at krakow day5)
          (at berlin day6)
          (at berlin day7)
          (at berlin day8)
          (at berlin day9)
          (at porto day10)
          (at porto day11)))
    )
  )
)