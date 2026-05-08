(define (problem trip_planning_example15_problem)
  (:domain trip_planning_example15)

  (:objects
    berlin porto krakow - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 - day
  )

  (:init
    (at krakow)
    (current day1)
    (visited krakow day1)

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
  )

  (:goal
    (and
      (current day11)

      (visited krakow day1)
      (visited krakow day2)
      (visited krakow day3)
      (visited krakow day4)
      (visited krakow day5)

      (visited berlin day6)
      (visited berlin day7)
      (visited berlin day8)
      (visited berlin day9)
      (visited berlin day10)
      (visited berlin day11)

      (visited porto day10)
      (visited porto day11)
    )
  )
)