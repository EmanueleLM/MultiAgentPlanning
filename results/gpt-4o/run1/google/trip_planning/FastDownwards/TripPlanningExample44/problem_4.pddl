(define (problem visit_european_cities)
  (:domain travel)

  (:objects
    rome lyon zurich - city
    day1 day2 day3 day4 day5 day6 day7
    day8 day9 day10 day11 day12 day13
    day14 day15 day16 day17 - day
  )

  (:init
    (current_city rome)
    (at_day day1)
    (next_day day1 day2) (next_day day2 day3)
    (next_day day3 day4) (next_day day4 day5)
    (next_day day5 day6) (next_day day6 day7)
    (next_day day7 day8) (next_day day8 day9)
    (next_day day9 day10) (next_day day10 day11)
    (next_day day11 day12) (next_day day12 day13)
    (next_day day13 day14) (next_day day14 day15)
    (next_day day15 day16) (next_day day16 day17)
    (flight_available rome lyon)
    (flight_available rome zurich)
    (flight_available zurich rome)
    (wedding_in_zurich_between_day1_and_day7)
  )

  (:goal (and
    (visited_city lyon)
    (visited_city zurich)
    (visited_city rome)
    (current_city rome)
    (at_day day17)
    (wedding_in_zurich_between_day1_and_day7)
  ))
)