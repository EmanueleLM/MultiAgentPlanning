(define (problem visit_european_cities)
  (:domain city_visit)

  (:objects
    valencia split lyon - location
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 day15 day16 - time
  )

  (:init
    ;; Initial position
    (at valencia day1)
    ;; Direct flight connections
    (connected lyon split)
    (connected valencia lyon)
    ;; Time progression
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
  )

  (:goal
    (and
      ;; Stay 5 days in Valencia (day1 to day5)
      (at valencia day2)
      (at valencia day3)
      (at valencia day4)
      (at valencia day5)
      ;; Travel to Lyon and stay 6 days (day6 to day10)
      (at lyon day6)
      (at lyon day7)
      (at lyon day8)
      (at lyon day9)
      (at lyon day10)
      ;; Travel to Split and stay for the show (day11 to day16)
      (at split day11)
      (at split day12)
      (at split day13)
      (at split day14)
      (at split day15)
      (at split day16)
    )
  )
)