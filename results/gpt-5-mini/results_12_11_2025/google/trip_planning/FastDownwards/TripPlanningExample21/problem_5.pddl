(define (problem trip10)
  (:domain trip-planning)
  (:objects
    mykonos vienna venice - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 - day
  )

  (:init
    ;; temporal ordering (discrete days)
    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)
    (next day5 day6)
    (next day6 day7)
    (next day7 day8)
    (next day8 day9)
    (next day9 day10)

    (first day1)

    ;; direct-flight connectivity (bidirectional edges)
    (direct mykonos vienna)
    (direct vienna mykonos)
    (direct vienna venice)
    (direct venice vienna)

    ;; all days initially unassigned; actions will assign exactly one city per day
    (unassigned day1)
    (unassigned day2)
    (unassigned day3)
    (unassigned day4)
    (unassigned day5)
    (unassigned day6)
    (unassigned day7)
    (unassigned day8)
    (unassigned day9)
    (unassigned day10)
  )

  (:goal (and
    ;; Enforce reconciled, exact per-day city assignment (hard constraints).
    ;; This fixes the contiguous Venice window (days 5-10) and visits all cities.
    (at day1 mykonos)
    (at day2 mykonos)
    (at day3 vienna)
    (at day4 vienna)
    (at day5 venice)
    (at day6 venice)
    (at day7 venice)
    (at day8 venice)
    (at day9 venice)
    (at day10 venice)

    ;; Ensure no day remains unassigned
    (not (unassigned day1))
    (not (unassigned day2))
    (not (unassigned day3))
    (not (unassigned day4))
    (not (unassigned day5))
    (not (unassigned day6))
    (not (unassigned day7))
    (not (unassigned day8))
    (not (unassigned day9))
    (not (unassigned day10))

    ;; Ensure all three cities are visited at least once
    (visited mykonos)
    (visited vienna)
    (visited venice)
  ))
)