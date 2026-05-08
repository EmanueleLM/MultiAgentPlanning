(define (problem tripplanningexample24_problem)
  (:domain tripplanningexample24)

  (:objects
    florence amsterdam riga - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 - day
  )

  (:init
    (at florence)

    (direct florence amsterdam)
    (direct amsterdam florence)
    (direct amsterdam riga)
    (direct riga amsterdam)

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
    (next day11 day12)
    (next day12 day13)
    (next day13 day14)

    (workshop_window day1)
    (workshop_window day2)
    (workshop_window day3)
    (workshop_window day4)

    (stay_day florence day1)
    (stay_day florence day2)
    (stay_day florence day3)
    (stay_day florence day4)

    (flight_day florence amsterdam day4)

    (stay_day amsterdam day5)
    (stay_day amsterdam day6)
    (stay_day amsterdam day7)
    (stay_day amsterdam day8)
    (stay_day amsterdam day9)

    (flight_day amsterdam riga day9)

    (stay_day riga day10)
    (stay_day riga day11)
    (stay_day riga day12)
    (stay_day riga day13)
  )

  (:goal
    (and
      (current_day day14)
      (at riga)
      (workshop_attended)
    )
  )
)