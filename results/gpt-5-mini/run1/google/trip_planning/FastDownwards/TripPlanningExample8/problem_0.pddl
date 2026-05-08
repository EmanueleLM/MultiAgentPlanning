(define (problem trip-16days)
  (:domain trip-planning)
  (:objects
    athens zurich krakow - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 day15 day16 - day
  )

  (:init
    ;; Explicit successor chain for days 1..16 (enforces discrete timeline)
    (succ day1 day2) (succ day2 day3) (succ day3 day4) (succ day4 day5)
    (succ day5 day6) (succ day6 day7) (succ day7 day8) (succ day8 day9)
    (succ day9 day10) (succ day10 day11) (succ day11 day12) (succ day12 day13)
    (succ day13 day14) (succ day14 day15) (succ day15 day16)

    ;; All days initially unassigned (must be assigned by actions)
    (unassigned day1) (unassigned day2) (unassigned day3) (unassigned day4)
    (unassigned day5) (unassigned day6) (unassigned day7) (unassigned day8)
    (unassigned day9) (unassigned day10) (unassigned day11) (unassigned day12)
    (unassigned day13) (unassigned day14) (unassigned day15) (unassigned day16)

    ;; Explicit total-days fact: enforces the 16-day horizon as a hard fact.
    (total-days-16)
  )

  (:goal (and
    ;; Hard constraints from auditor's Fix Set A (concrete placement):
    ;; Athens: days 1..7 (7 consecutive days), trip-start at day1 (no inbound flight required)
    (in athens day1) (in athens day2) (in athens day3)
    (in athens day4) (in athens day5) (in athens day6) (in athens day7)

    ;; Flight Athens -> Zurich on Day 8 (required by Athens fragment outbound)
    (flight-taken athens zurich day8)

    ;; Zurich: days 8..10 inclusive (3 consecutive days)
    (in zurich day8) (in zurich day9) (in zurich day10)

    ;; Flight Zurich -> Krakow on Day 11 (required by Kraków arrival-from-Zurich constraint)
    (flight-taken zurich krakow day11)

    ;; Kraków: days 11..16 inclusive (6 consecutive days), trip-end (no outbound required)
    (in krakow day11) (in krakow day12) (in krakow day13)
    (in krakow day14) (in krakow day15) (in krakow day16)

    ;; Confirm the enforced total-day horizon is present (explicit terminal condition)
    (total-days-16)
  ))
)