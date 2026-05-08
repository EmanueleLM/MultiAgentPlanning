(define (problem tripplanningexample5)
  (:domain tripplanningexample5_domain)

  (:objects
    oslo porto dubrovnik - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 day15 day16 - day
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
    (next day11 day12)
    (next day12 day13)
    (next day13 day14)
    (next day14 day15)
    (next day15 day16)

    (direct oslo dubrovnik)
    (direct dubrovnik oslo)
    (direct porto oslo)
    (direct oslo porto)
  )

  (:goal
    (and
      (current_day day16)

      (visited oslo)
      (visited porto)
      (visited dubrovnik)

      (at porto day1)
      (at porto day2)
      (at porto day3)
      (at porto day4)
      (at porto day5)
      (at porto day6)
      (at porto day7)

      (at oslo day8)
      (at oslo day9)
      (at oslo day10)
      (at oslo day11)
      (at oslo day12)
      (at oslo day13)

      (at dubrovnik day12)
      (at dubrovnik day13)
      (at dubrovnik day14)
      (at dubrovnik day15)
      (at dubrovnik day16)
    )
  )
)