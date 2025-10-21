(define (problem trip_m-b-l_17days)
  (:domain trip_planning)
  (:objects
    traveler - agent
    manchester bucharest lyon - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 day15 day16 day17 - day
  )

  (:init
    ;; direct flight network (only direct legs allowed)
    (direct manchester bucharest)
    (direct bucharest manchester)
    (direct bucharest lyon)
    (direct lyon bucharest)
    ;; Note: No direct manchester <-> lyon facts present per input constraints

    ;; temporal next relation linking consecutive days
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
    (next day16 day17)

    ;; Initially day1 is assigned: traveler starts in Manchester on day1 (matches proposed itinerary)
    (at traveler manchester day1)

    ;; All subsequent days are initially unassigned and must be assigned by actions
    (unused day2)
    (unused day3)
    (unused day4)
    (unused day5)
    (unused day6)
    (unused day7)
    (unused day8)
    (unused day9)
    (unused day10)
    (unused day11)
    (unused day12)
    (unused day13)
    (unused day14)
    (unused day15)
    (unused day16)
    (unused day17)
  )

  (:goal
    (and
      ;; Enforce the chosen feasible allocation (hard constraints derived from the orchestrator's plan):
      ;; Manchester: days 1-5
      (at traveler manchester day1)
      (at traveler manchester day2)
      (at traveler manchester day3)
      (at traveler manchester day4)
      (at traveler manchester day5)

      ;; Bucharest: days 6-12
      (at traveler bucharest day6)
      (at traveler bucharest day7)
      (at traveler bucharest day8)
      (at traveler bucharest day9)
      (at traveler bucharest day10)
      (at traveler bucharest day11)
      (at traveler bucharest day12)

      ;; Lyon: days 13-17 (relatives' visit window, fixed)
      (at traveler lyon day13)
      (at traveler lyon day14)
      (at traveler lyon day15)
      (at traveler lyon day16)
      (at traveler lyon day17)
    )
  )
)