(define (problem visit_european_cities)
  (:domain travel)

  (:objects
    rome lyon zurich - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 day15 day16 day17 - day
  )

  (:init
    (current_city rome)
    (flight_available rome lyon)
    (flight_available zurich rome)
    (day day1) (day day2) (day day3) (day day4) (day day5) (day day6) (day day7)
    (day day8) (day day9) (day day10) (day day11) (day day12) (day day13) (day day14)
    (day day15) (day day16) (day day17)
    (wedding_in_zurich day1)
    (wedding_in_zurich day2)
    (wedding_in_zurich day3)
    (wedding_in_zurich day4)
    (wedding_in_zurich day5)
    (wedding_in_zurich day6)
    (wedding_in_zurich day7)
  )

  (:goal (and
    (visited_city lyon)
    (visited_city zurich)
    (visited_city rome)
    (in_lyon day1) (in_lyon day2) (in_lyon day3) (in_lyon day4) (in_lyon day5) (in_lyon day6)
    (in_zurich day7) (in_zurich day8) (in_zurich day9) (in_zurich day10) (in_zurich day11) (in_zurich day12) (in_zurich day13)
    (in_rome day14) (in_rome day15) (in_rome day16) (in_rome day17)
  ))
)