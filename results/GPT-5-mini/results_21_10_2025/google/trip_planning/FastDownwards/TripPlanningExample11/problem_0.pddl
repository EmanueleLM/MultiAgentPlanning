(define (problem travel-itinerary-15d)
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

    ;; Note: Remaining days (day2..day15) will be assigned by stay or fly actions.
  )

  ;; Goals enforce the strict per-day city presence and thus the visitation order and flight days.
  ;; Vilnius: Days 1-4 (arrive Day1, depart Day5 — stay Days 1–4)
  ;; Vienna: Days 5-8 (arrive Day5, depart Day9 — stay Days 5–8)
  ;; Valencia: Days 9-15 (arrive Day9, depart Day15/trip end)
  (:goal (and
    ;; Vilnius stays
    (at traveler vilnius day1)
    (at traveler vilnius day2)
    (at traveler vilnius day3)
    (at traveler vilnius day4)

    ;; Vienna stays
    (at traveler vienna day5)
    (at traveler vienna day6)
    (at traveler vienna day7)
    (at traveler vienna day8)

    ;; Valencia stays including conferences on day9 and day15
    (at traveler valencia day9)
    (at traveler valencia day10)
    (at traveler valencia day11)
    (at traveler valencia day12)
    (at traveler valencia day13)
    (at traveler valencia day14)
    (at traveler valencia day15)
  ))
)