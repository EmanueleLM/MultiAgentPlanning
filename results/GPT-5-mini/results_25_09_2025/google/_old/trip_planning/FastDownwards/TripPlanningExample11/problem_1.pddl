(define (problem integrated-trip-problem)
  (:domain integrated_trip)

  (:objects
    vienna vilnius valencia - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 day15 day16 - day
  )

  (:init
    ;; current day is day1 at start
    (current-day day1)

    ;; starting location
    (at vienna)

    ;; not started yet (agent1 must call begin to consume the first day)
    ;; by absence of (started) it is false

    ;; direct-flight connectivity (public knowledge)
    (direct vienna valencia)
    (direct valencia vienna)
    (direct vienna vilnius)
    (direct vilnius vienna)

    ;; successor (next) relation for days (precomputed arithmetic)
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
    (next day11 day12)
    (next day12 day13)
    (next day13 day14)
    (next day14 day15)
    (next day15 day16)

    ;; conferences not attended initially: predicates absent in init represent false
  )

  (:goal
    (and
      (conf9-done)
      (conf15-done)
      (attended9)
      (attended15)
      (current-day day16)
      (visited vienna)
      (visited vilnius)
      (visited valencia)
    )
  )
)