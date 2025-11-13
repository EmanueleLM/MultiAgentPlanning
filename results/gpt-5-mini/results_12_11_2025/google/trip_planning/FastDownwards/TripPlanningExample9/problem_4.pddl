(define (problem tripplanningexample9)
  (:domain trip-planning)
  (:objects
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 - day
    frankfurt bucharest stuttgart - city
  )

  (:init
    (next day1 day2) (next day2 day3) (next day3 day4) (next day4 day5)
    (next day5 day6) (next day6 day7) (next day7 day8) (next day8 day9)
    (next day9 day10) (next day10 day11)

    (day-unassigned day1) (day-unassigned day2) (day-unassigned day3)
    (day-unassigned day4) (day-unassigned day5) (day-unassigned day6)
    (day-unassigned day7) (day-unassigned day8) (day-unassigned day9)
    (day-unassigned day10)

    (next-to-assign day1)
    (first-day day1)

    (city-available bucharest) (city-available frankfurt) (city-available stuttgart)

    (window-day day5) (window-day day6) (window-day day7)
    (window-day day8) (window-day day9) (window-day day10)

    (flight bucharest frankfurt) (flight frankfurt bucharest)
    (flight frankfurt stuttgart) (flight stuttgart frankfurt)
  )

  (:goal
    (and
      (not (day-unassigned day1)) (not (day-unassigned day2)) (not (day-unassigned day3))
      (not (day-unassigned day4)) (not (day-unassigned day5)) (not (day-unassigned day6))
      (not (day-unassigned day7)) (not (day-unassigned day8)) (not (day-unassigned day9))
      (not (day-unassigned day10))
      (attended-workshop)
    )
  )
)