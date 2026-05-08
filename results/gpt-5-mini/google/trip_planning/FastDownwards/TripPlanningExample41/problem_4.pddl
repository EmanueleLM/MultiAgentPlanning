(define (problem trip_13_days)
  (:domain trip_planning)
  (:objects
    stockholm athens mykonos - city

    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 - day
  )

  (:init
    ;; temporal ordering of the 13 days
    (next_day day1 day2)
    (next_day day2 day3)
    (next_day day3 day4)
    (next_day day4 day5)
    (next_day day5 day6)
    (next_day day6 day7)
    (next_day day7 day8)
    (next_day day8 day9)
    (next_day day9 day10)
    (next_day day10 day11)
    (next_day day11 day12)
    (next_day day12 day13)

    ;; direct flights (bidirectional where provided by the specification)
    (flight athens mykonos)
    (flight mykonos athens)
    (flight stockholm athens)
    (flight athens stockholm)

    ;; initial presence: conference on day1 in stockholm is fixed
    (at stockholm day1)
    (day_assigned day1)
  )

  (:goal (and
    ;; Hard temporal/conference constraints from the specification:
    ;; must be in stockholm on day1 and on day6
    (at stockholm day1)
    (at stockholm day6)

    ;; The user requested totals that are inconsistent with 13 days:
    ;; - 6 days in stockholm
    ;; - 5 days in athens
    ;; - 4 days in mykonos
    ;;
    ;; To preserve the exact hard constraints of the request (and to
    ;; conservatively expose the inconsistency rather than silently
    ;; relax it), the goal below explicitly requires the stated counts
    ;; by listing required day-city assignments. These requirements are
    ;; jointly impossible on the 13 available days (6+5+4 = 15),
    ;; therefore the problem is unsolvable as specified.

    ;; Require 6 days in stockholm (day1..day6)
    (at stockholm day1)
    (at stockholm day2)
    (at stockholm day3)
    (at stockholm day4)
    (at stockholm day5)
    (at stockholm day6)

    ;; Require 5 days in athens (day1..day5)
    (at athens day1)
    (at athens day2)
    (at athens day3)
    (at athens day4)
    (at athens day5)

    ;; Require 4 days in mykonos (day1..day4)
    (at mykonos day1)
    (at mykonos day2)
    (at mykonos day3)
    (at mykonos day4)
  ))
)