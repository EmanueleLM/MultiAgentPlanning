(define (problem trip-16days-audit)
  (:domain trip-integration)

  (:objects
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 day15 day16 - day
    athens zurich krakow - city
  )

  (:init
    ;; explicit day-ordering (successor links)
    (next day1 day2) (next day2 day3) (next day3 day4) (next day4 day5)
    (next day5 day6) (next day6 day7) (next day7 day8) (next day8 day9)
    (next day9 day10) (next day10 day11) (next day11 day12) (next day12 day13)
    (next day13 day14) (next day14 day15) (next day15 day16)

    ;; direct flight connectivity (bidirectional edges)
    (direct-flight athens zurich)
    (direct-flight zurich athens)
    (direct-flight zurich krakow)
    (direct-flight krakow zurich)

    ;; Hard constraint: days 1..7 are in Athens (visiting relatives window enforced)
    (assigned day1) (at day1 athens)
    (assigned day2) (at day2 athens)
    (assigned day3) (at day3 athens)
    (assigned day4) (at day4 athens)
    (assigned day5) (at day5 athens)
    (assigned day6) (at day6 athens)
    (assigned day7) (at day7 athens)

    ;; Days 8..16 start unassigned so they must be assigned by stay/fly actions
  )

  ;; Final required assignment (auditor's recommended resolution):
  ;; - Athens: days 1..7 (hard window)
  ;; - Zurich: days 8..10 (3 contiguous days)
  ;; - Krakow: days 11..16 (6 contiguous days)
  (:goal (and
    (at day1 athens) (assigned day1)
    (at day2 athens) (assigned day2)
    (at day3 athens) (assigned day3)
    (at day4 athens) (assigned day4)
    (at day5 athens) (assigned day5)
    (at day6 athens) (assigned day6)
    (at day7 athens) (assigned day7)

    (at day8 zurich)  (assigned day8)
    (at day9 zurich)  (assigned day9)
    (at day10 zurich) (assigned day10)

    (at day11 krakow) (assigned day11)
    (at day12 krakow) (assigned day12)
    (at day13 krakow) (assigned day13)
    (at day14 krakow) (assigned day14)
    (at day15 krakow) (assigned day15)
    (at day16 krakow) (assigned day16)
  ))
)