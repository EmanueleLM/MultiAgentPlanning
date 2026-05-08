(define (problem trip_planning_example15_problem)
  (:domain trip_planning_example15)

  (:objects
    berlin porto krakow - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 - day
  )

  (:init
    (at krakow)
    (current_day day1)
    (used_day day1)
    (in_city_on krakow day1)

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

    (direct berlin porto)
    (direct porto berlin)
    (direct krakow berlin)
    (direct berlin krakow)

    (wedding_day day10)
    (wedding_day day11)
  )

  (:goal
    (and
      (current_day day11)

      (in_city_on krakow day1)
      (in_city_on krakow day2)
      (in_city_on krakow day3)
      (in_city_on krakow day4)
      (in_city_on krakow day5)

      (in_city_on berlin day6)
      (in_city_on berlin day7)
      (in_city_on berlin day8)
      (in_city_on berlin day9)
      (in_city_on berlin day10)
      (in_city_on berlin day11)

      (in_city_on porto day10)
      (in_city_on porto day11)
    )
  )
)