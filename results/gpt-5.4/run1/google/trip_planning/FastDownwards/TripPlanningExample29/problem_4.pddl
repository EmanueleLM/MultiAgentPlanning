(define (problem european_trip_10_days_instance_problem)
  (:domain european_trip_10_days_instance)

  (:objects
    frankfurt krakow dubrovnik - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 - day
  )

  (:init
    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)
    (next day5 day6)
    (next day6 day7)
    (next day7 day8)
    (next day8 day9)
    (next day9 day10)

    (direct frankfurt krakow)
    (direct krakow frankfurt)
    (direct dubrovnik frankfurt)
    (direct frankfurt dubrovnik)

    (current day1)

    (wedding_day day9)
    (wedding_day day10)
  )

  (:goal
    (and
      (visited frankfurt)
      (visited krakow)
      (visited dubrovnik)
      (at dubrovnik day7)
      (at krakow day9)
      (at krakow day10)
      (wedding_attended)
    )
  )
)