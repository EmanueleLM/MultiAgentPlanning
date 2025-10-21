(define (problem integrated-11-day-trip)
  (:domain trip-orchestration)
  (:objects
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 - day
  )

  (:init
    ;; day succession
    (day_next day1 day2)
    (day_next day2 day3)
    (day_next day3 day4)
    (day_next day4 day5)
    (day_next day5 day6)
    (day_next day6 day7)
    (day_next day7 day8)
    (day_next day8 day9)
    (day_next day9 day10)
    (day_next day10 day11)

    ;; available direct flights (only direct flights allowed)
    (direct_flight copenhagen vienna)
    (direct_flight vienna lyon)
    (direct_flight lyon vienna)

    ;; Initial location: trip starts in Copenhagen on Day 1
    (at copenhagen day1)
  )

  ;; Chosen reconciliation: Option B (preserve Copenhagen 5 days and Vienna 4 days; shorten Lyon to 2 days)
  ;; This encodes the required presence for each day:
  ;; Copenhagen days: 1-5 (conferences mandatory on day1 and day5 preserved)
  ;; Vienna days: 6-9 (arrival on Day6, departure morning Day10)
  ;; Lyon days: 10-11 (arrival on Day10 via direct Vienna->Lyon on morning of Day10)

  (:goal (and
    ;; Copenhagen mandatory days (preserve conferences day1 and day5)
    (at copenhagen day1)
    (at copenhagen day2)
    (at copenhagen day3)
    (at copenhagen day4)
    (at copenhagen day5)

    ;; Vienna stay Days 6-9 (arrival Day6; departure morning Day10)
    (at vienna day6)
    (at vienna day7)
    (at vienna day8)
    (at vienna day9)

    ;; Lyon stay Days 10-11 (arrival Day10 via direct Vienna->Lyon)
    (at lyon day10)
    (at lyon day11)
  ))
)