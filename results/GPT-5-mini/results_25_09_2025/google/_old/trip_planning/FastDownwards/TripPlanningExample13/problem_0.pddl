(define (problem schedule-3-cities-17)
  (:domain integrated-trip)

  (:objects
    manchester bucharest lyon - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 day15 day16 day17 - day
  )

  (:init
    ;; Direct flights (bidirectional per the inputs)
    (direct manchester bucharest)
    (direct bucharest manchester)
    (direct bucharest lyon)
    (direct lyon bucharest)

    ;; Day succession chain for a 17-day trip
    (next day1 day2) (next day2 day3) (next day3 day4) (next day4 day5)
    (next day5 day6) (next day6 day7) (next day7 day8) (next day8 day9)
    (next day9 day10) (next day10 day11) (next day11 day12) (next day12 day13)
    (next day13 day14) (next day14 day15) (next day15 day16) (next day16 day17)

    ;; Initialize per-city day counters to zero
    (= (days-in manchester) 0)
    (= (days-in bucharest) 0)
    (= (days-in lyon) 0)

    ;; Note: no initial (at ...) fact is given; one of the start actions must be applied to set the starting city on day1.
  )

  ;; Goals:
  ;; - Trip must be started.
  ;; - Manchester must accumulate exactly 7 days.
  ;; - Bucharest is set to 5 days here (relaxed from the Bucharest agent's original 7 because of a conflict),
  ;;   so that Manchester 7 + Bucharest 5 + Lyon 5 = 17 total days.
  ;; - Lyon must be occupied on days 13..17 (the 5-day window).
  (:goal (and
    (trip-started)
    (= (days-in manchester) 7)
    (= (days-in bucharest) 5)
    (= (days-in lyon) 5)
    (at lyon day13)
    (at lyon day14)
    (at lyon day15)
    (at lyon day16)
    (at lyon day17)
  ))
)