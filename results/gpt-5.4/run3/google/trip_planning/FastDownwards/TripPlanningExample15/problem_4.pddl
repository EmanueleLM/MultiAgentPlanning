(define (problem trip_planning_example15_instance)
  (:domain trip_planning_example15)

  (:objects
    berlin porto krakow - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 - day
  )

  (:init
    (current_day day1)

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
    (direct berlin krakow)
    (direct krakow berlin)
  )

  (:goal
    (and
      (current_day day11)

      (visited berlin day1)
      (visited berlin day2)
      (visited berlin day3)
      (visited berlin day4)
      (visited berlin day5)
      (visited berlin day6)

      (visited krakow day7)
      (visited krakow day8)
      (visited krakow day9)

      (visited porto day10)
      (visited porto day11)
    )
  )
)