(define (problem trip17)
  (:domain trip-planning)
  (:objects
    traveler - person
    lyon bucharest manchester - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 day15 day16 day17 - day
  )

  (:init
    ;; day successor relations
    (next day1 day2) (next day2 day3) (next day3 day4) (next day4 day5)
    (next day5 day6) (next day6 day7) (next day7 day8) (next day8 day9)
    (next day9 day10) (next day10 day11) (next day11 day12) (next day12 day13)
    (next day13 day14) (next day14 day15) (next day15 day16) (next day16 day17)

    ;; Starting location (chosen as Bucharest to allow both direct connections).
    ;; Note: starting city was not provided in input; this is a necessary initial choice
    ;; to form a concrete planning problem. The core hard constraints are encoded in the goal.
    (at traveler bucharest day1)
    (occupied day1)

    ;; Direct flight connectivity (symmetric edges provided by flights_office)
    (direct manchester bucharest)
    (direct bucharest manchester)
    (direct bucharest lyon)
    (direct lyon bucharest)
  )

  ;; Goals encode the hard stay-length constraints and relatives window as provided.
  ;; The stays are encoded as explicit per-day location requirements. These exact
  ;; constraints (5+7+7 = 19 required days on a 17-day horizon) are intentionally
  ;; left as given; the resulting problem is expected to be unsolvable without
  ;; relaxation of the hard constraints.
  (:goal (and
    ;; Lyon: 5 days (day1..day5)
    (at traveler lyon day1)
    (at traveler lyon day2)
    (at traveler lyon day3)
    (at traveler lyon day4)
    (at traveler lyon day5)

    ;; Bucharest: 7 days (day6..day12)
    (at traveler bucharest day6)
    (at traveler bucharest day7)
    (at traveler bucharest day8)
    (at traveler bucharest day9)
    (at traveler bucharest day10)
    (at traveler bucharest day11)
    (at traveler bucharest day12)

    ;; Manchester: 7 days (day11..day17) -- note overlap with Bucharest on day11/day12,
    ;; intentionally reflecting the over-subscription from the input hard constraints.
    (at traveler manchester day11)
    (at traveler manchester day12)
    (at traveler manchester day13)
    (at traveler manchester day14)
    (at traveler manchester day15)
    (at traveler manchester day16)
    (at traveler manchester day17)

    ;; Relatives visit: must be in Lyon between day13 and day17 inclusive.
    ;; The earliest slot in that window is day13 (chosen per instruction to prefer earliest feasible meeting slot).
    (at traveler lyon day13)
  ))
)