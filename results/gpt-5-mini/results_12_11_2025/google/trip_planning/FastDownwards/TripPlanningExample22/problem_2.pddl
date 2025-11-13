(define (problem trip-11days)
  (:domain trip-planning)
  (:objects
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 - day
    berlin frankfurt bucharest - city
  )

  (:init
    ;; current pointer at day1
    (current day1)
    (first day1)

    ;; successor relation
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

    ;; all days initially unassigned
    (unassigned day1) (unassigned day2) (unassigned day3) (unassigned day4) (unassigned day5)
    (unassigned day6) (unassigned day7) (unassigned day8) (unassigned day9) (unassigned day10) (unassigned day11)

    ;; direct flights (given)
    (flight berlin frankfurt)
    (flight frankfurt berlin)
    (flight frankfurt bucharest)
    (flight bucharest frankfurt)
  )

  (:goal (and
    ;; every day must be assigned to some city (no unassigned days remain)
    (not (unassigned day1)) (not (unassigned day2)) (not (unassigned day3))
    (not (unassigned day4)) (not (unassigned day5)) (not (unassigned day6))
    (not (unassigned day7)) (not (unassigned day8)) (not (unassigned day9))
    (not (unassigned day10)) (not (unassigned day11))

    ;; must visit all three cities at least once
    (visited berlin) (visited frankfurt) (visited bucharest)
  ))