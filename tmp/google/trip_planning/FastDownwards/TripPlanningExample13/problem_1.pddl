(define (problem schedule-3-cities-17)
  (:domain integrated-trip)

  (:objects
    manchester bucharest lyon - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 day15 day16 day17 - day
    n0 n1 n2 n3 n4 n5 n6 n7 n8 n9 n10 n11 n12 n13 n14 n15 n16 n17 - cnt
  )

  (:init
    ;; Direct flights (bidirectional)
    (direct manchester bucharest)
    (direct bucharest manchester)
    (direct bucharest lyon)
    (direct lyon bucharest)

    ;; Day succession chain for a 17-day trip
    (next day1 day2) (next day2 day3) (next day3 day4) (next day4 day5)
    (next day5 day6) (next day6 day7) (next day7 day8) (next day8 day9)
    (next day9 day10) (next day10 day11) (next day11 day12) (next day12 day13)
    (next day13 day14) (next day14 day15) (next day15 day16) (next day16 day17)

    ;; Successor relation for counts
    (succ n0 n1) (succ n1 n2) (succ n2 n3) (succ n3 n4) (succ n4 n5)
    (succ n5 n6) (succ n6 n7) (succ n7 n8) (succ n8 n9) (succ n9 n10)
    (succ n10 n11) (succ n11 n12) (succ n12 n13) (succ n13 n14)
    (succ n14 n15) (succ n15 n16) (succ n16 n17)

    ;; Initialize per-city counters to zero
    (spent manchester n0)
    (spent bucharest n0)
    (spent lyon n0)

    ;; Note: No initial (at ...) fact is given; one of the start actions must be applied to set the starting city on day1.
  )

  (:goal (and
    (trip-started)
    (trip-finished)
    (spent manchester n7)
    (spent bucharest n5)
    (spent lyon n5)
    (at lyon day13)
    (at lyon day14)
    (at lyon day15)
    (at lyon day16)
    (at lyon day17)
  ))
)