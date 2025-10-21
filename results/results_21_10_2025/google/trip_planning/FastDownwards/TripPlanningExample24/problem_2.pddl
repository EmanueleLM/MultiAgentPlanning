(define (problem trip-13days)
  (:domain trip-planner)

  (:init
    ;; Public information: only these direct flights are available (both directions)
    (direct-flight florence amsterdam)
    (direct-flight amsterdam florence)
    (direct-flight amsterdam riga)
    (direct-flight riga amsterdam)

    ;; Initially no days are assigned and workshop not scheduled (these are simply absent facts).
    ;; The scheduling action will assign all days and set the workshop flag.
  )

  (:goal (and
    ;; All 13 days are assigned (ensures total trip duration is exactly 13 days)
    (assigned day1) (assigned day2) (assigned day3) (assigned day4)
    (assigned day5) (assigned day6) (assigned day7) (assigned day8)
    (assigned day9) (assigned day10) (assigned day11) (assigned day12) (assigned day13)

    ;; Each city is visited at least once
    (visited florence)
    (visited amsterdam)
    (visited riga)

    ;; Workshop must occur while in Florence and within days 1..4 (the schedule action guarantees this)
    (workshop-scheduled)
  ))
)