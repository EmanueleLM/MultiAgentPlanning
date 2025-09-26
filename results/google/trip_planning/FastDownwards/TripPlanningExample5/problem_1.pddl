(define (problem trip-planning-prob)
  (:domain trip-planning)
  (:objects
    oslo porto dubrovnik - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 day15 day16 - day
    n1 n2 n3 n4 n5 n6 n7 n8 n9 n10 n11 n12 n13 n14 n15 n16 - num
  )
  (:init
    (succ day1 day2) (succ day2 day3) (succ day3 day4) (succ day4 day5) (succ day5 day6) (succ day6 day7) (succ day7 day8) (succ day8 day9) (succ day9 day10) (succ day10 day11) (succ day11 day12) (succ day12 day13) (succ day13 day14) (succ day14 day15) (succ day15 day16)
    (direct-flight oslo dubrovnik) (direct-flight dubrovnik oslo) (direct-flight porto oslo) (direct-flight oslo porto)
    (total-days n16)
    (desired-stay oslo n6)
    (desired-stay porto n7)
    (desired-stay dubrovnik n5)
    (conference dubrovnik day12)
    (conference dubrovnik day16)
  )
  (:goal (and
    (assigned day1) (assigned day2) (assigned day3) (assigned day4) (assigned day5) (assigned day6) (assigned day7) (assigned day8) (assigned day9) (assigned day10) (assigned day11) (assigned day12) (assigned day13) (assigned day14) (assigned day15) (assigned day16)
    (at dubrovnik day12)
    (at dubrovnik day16)
  ))
)