(define (problem tripplanningexample24_problem)
  (:domain tripplanningexample24)

  (:objects
    florence amsterdam riga - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 - day
  )

  (:init
    (direct florence amsterdam)
    (direct amsterdam florence)
    (direct amsterdam riga)
    (direct riga amsterdam)

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
    (next day11 day12)
    (next day12 day13)
    (next day13 day14)

    (workshop_day day1)
    (workshop_day day2)
    (workshop_day day3)
    (workshop_day day4)

    (at florence)
    (current_day day1)
  )

  (:goal
    (and
      (current_day day14)
      (workshop_attended)

      (visited_day day1 florence)
      (visited_day day2 florence)
      (visited_day day3 florence)
      (visited_day day4 florence)

      (visited_day day5 amsterdam)
      (visited_day day6 amsterdam)
      (visited_day day7 amsterdam)
      (visited_day day8 amsterdam)
      (visited_day day9 amsterdam)
      (visited_day day10 amsterdam)

      (visited_day day11 riga)
      (visited_day day12 riga)
      (visited_day day13 riga)
    )
  )
)