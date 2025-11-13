(define (problem trip-plan)
  (:domain trip-planning)
  (:objects
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 - day
    reykjavik vienna venice - city
  )

  (:init
    ;; Initial assignment: start in Reykjavik on day1 (audited plan)
    (at day1 reykjavik)

    ;; All other days start unassigned and must be filled sequentially via assign-next actions
    (unassigned day2)
    (unassigned day3)
    (unassigned day4)
    (unassigned day5)
    (unassigned day6)
    (unassigned day7)
    (unassigned day8)
    (unassigned day9)
    (unassigned day10)
    (unassigned day11)

    ;; Day ordering (discrete, contiguous days)
    (day-next day1 day2)
    (day-next day2 day3)
    (day-next day3 day4)
    (day-next day4 day5)
    (day-next day5 day6)
    (day-next day6 day7)
    (day-next day7 day8)
    (day-next day8 day9)
    (day-next day9 day10)
    (day-next day10 day11)

    ;; Connectivity: direct flights and staying-in-place (self loops).
    ;; Allowed moves: reykjavik <-> vienna, vienna <-> venice, and staying in the same city.
    (connected reykjavik reykjavik)
    (connected vienna vienna)
    (connected venice venice)

    (connected reykjavik vienna)
    (connected vienna reykjavik)

    (connected vienna venice)
    (connected venice vienna)
  )

  ;; Goal: enforce the finalized audited day-by-day plan exactly.
  ;; This encodes contiguous occupancy blocks and satisfies the wedding requirement
  ;; (the traveler is in Venice during days 8..11).
  (:goal (and
    (at day1 reykjavik)
    (at day2 reykjavik)
    (at day3 vienna)
    (at day4 vienna)
    (at day5 vienna)
    (at day6 vienna)
    (at day7 vienna)
    (at day8 venice)
    (at day9 venice)
    (at day10 venice)
    (at day11 venice)
  ))
)