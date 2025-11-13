(define (problem trip-11days)
  (:domain trip-planning)
  (:objects
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 - day
    berlin frankfurt bucharest - city
  )

  (:init
    (current day1)
    (is_first day1)

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

    (unassigned day1) (unassigned day2) (unassigned day3) (unassigned day4) (unassigned day5)
    (unassigned day6) (unassigned day7) (unassigned day8) (unassigned day9) (unassigned day10) (unassigned day11)

    (flight berlin frankfurt)
    (flight frankfurt berlin)
    (flight frankfurt bucharest)
    (flight bucharest frankfurt)

    (show_day day1) (show_day day2) (show_day day3) (show_day day4) (show_day day5) (show_day day6) (show_day day7)
  )

  (:goal (and
    (not (unassigned day1)) (not (unassigned day2)) (not (unassigned day3))
    (not (unassigned day4)) (not (unassigned day5)) (not (unassigned day6))
    (not (unassigned day7)) (not (unassigned day8)) (not (unassigned day9))
    (not (unassigned day10)) (not (unassigned day11))

    (visited berlin) (visited frankfurt) (visited bucharest)
  ))
)