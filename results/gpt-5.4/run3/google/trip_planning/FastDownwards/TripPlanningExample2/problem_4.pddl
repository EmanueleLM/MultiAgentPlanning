(define (problem tripplanningexample2_problem)
  (:domain tripplanningexample2)

  (:objects
    reykjavik vienna venice - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 - day
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
    (next day10 day11)

    (direct reykjavik vienna)
    (direct vienna reykjavik)
    (direct vienna venice)
    (direct venice vienna)
  )

  (:goal
    (and
      (current_day day11)
      (visited_reykjavik)
      (visited_vienna)
      (visited_venice)
      (in reykjavik day1)
      (in reykjavik day2)
      (in vienna day3)
      (in vienna day4)
      (in vienna day5)
      (in vienna day6)
      (in vienna day7)
      (in venice day8)
      (in venice day9)
      (in venice day10)
      (in venice day11)
    )
  )
)