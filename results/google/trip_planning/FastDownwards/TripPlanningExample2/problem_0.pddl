(define (problem trip-11days)
  (:domain travel)
  (:objects
    reykjavik vienna venice - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 - day
  )

  (:init
    ;; direct flights available (only direct flights allowed by design)
    (flight reykjavik vienna)
    (flight vienna reykjavik)
    (flight vienna venice)
    (flight venice vienna)

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

    ;; start location
    (at reykjavik day1)
  )

  ;; Goals encode a feasible 11-day itinerary using only direct flights,
  ;; attending the Venice wedding at the earliest allowed day (day8),
  ;; and satisfying stays that have been adjusted to fit the 11-day trip:
  ;; Reykjavik: days 1-2 (2 days), Vienna: days 3-7 (5 days), Venice: days 8-11 (4 days).
  (:goal (and
    (at reykjavik day2)    ;; Reykjavik total 2 days (day1 initial, day2 via stay)
    (at vienna day3)
    (at vienna day4)
    (at vienna day5)
    (at vienna day6)
    (at vienna day7)       ;; Vienna total 5 days (day3-day7)
    (at venice day8)       ;; Attend wedding on earliest allowed day (day8)
    (at venice day9)
    (at venice day10)
    (at venice day11)      ;; Venice total 4 days (day8-day11)
  ))
)