(define (problem TripPlanningExample11)
  (:domain travel-domain)
  (:objects
    traveler - agent
    vilnius vienna valencia - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 day15 - day
  )

  (:init
    ;; direct connections (bidirectional as provided)
    (connected vilnius vienna)
    (connected vienna vilnius)
    (connected vienna valencia)
    (connected valencia vienna)

    ;; day succession
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

    ;; initial location: arrive Vilnius on Day 1
    (at traveler vilnius day1)
    (occupied day1)  ; Day 1 already assigned by arrival
  )

  ;; Goals enforce the required per-day presence to meet the traveler's conference constraints
  ;; and the intended stays (this encoding makes the derived itinerary the only way to satisfy all constraints).
  (:goal (and
    ;; Vilnius stays: Day1-Day4
    (at traveler vilnius day1)
    (at traveler vilnius day2)
    (at traveler vilnius day3)
    (at traveler vilnius day4)

    ;; Vienna stays: Day5-Day8
    (at traveler vienna day5)
    (at traveler vienna day6)
    (at traveler vienna day7)
    (at traveler vienna day8)

    ;; Valencia stays (includes conferences on Day9 and Day15): Day9-Day15
    (at traveler valencia day9)
    (at traveler valencia day10)
    (at traveler valencia day11)
    (at traveler valencia day12)
    (at traveler valencia day13)
    (at traveler valencia day14)
    (at traveler valencia day15)
  ))
)