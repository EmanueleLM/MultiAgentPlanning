(define (problem trip-optionA)
  (:domain trip-scheduling)
  (:objects
    venice florence zurich - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 - day
  )

  (:init
    ;; day successor chain
    (succ day1 day2) (succ day2 day3) (succ day3 day4) (succ day4 day5)
    (succ day5 day6) (succ day6 day7) (succ day7 day8) (succ day8 day9)
    (succ day9 day10) (succ day10 day11) (succ day11 day12) (succ day12 day13)

    ;; start at day1
    (current-day day1)

    ;; start location: Venice (chosen as start for this problem instance)
    (at venice)

    ;; initial counts = 0
    (v-count-0) (f-count-0) (z-count-0)

    ;; other count atoms false implicitly (STRIPS)
  )

  ;; Goal encodes the recommended Option A as a strict constraint:
  ;; Venice 5 days, Florence 5 days, Zurich 2 days, and all 12 days consumed (current-day = day13).
  (:goal
    (and
      (v-count-5)
      (f-count-5)
      (z-count-2)
      (current-day day13)
    )
  )
)