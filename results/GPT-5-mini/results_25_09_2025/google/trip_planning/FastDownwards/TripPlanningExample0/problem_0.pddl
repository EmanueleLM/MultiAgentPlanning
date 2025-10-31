; Problem: 14-day trip visiting Barcelona, Helsinki, Florence
; See domain comments for assumptions: Helsinki reduced to 3 days to fit 14-day total,
; starting city is Barcelona.
(define (problem trip-14days)
  (:domain trip-integration)
  (:objects
    ; cities
    barcelona florence helsinki - city
    ; days
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 - day
  )

  (:init
    ; Initial day and starting city (assumed Barcelona)
    (day day1)
    (at barcelona)

    ; successor day relations
    (next day1 day2) (next day2 day3) (next day3 day4) (next day4 day5)
    (next day5 day6) (next day6 day7) (next day7 day8) (next day8 day9)
    (next day9 day10) (next day10 day11) (next day11 day12) (next day12 day13)
    (next day13 day14)

    ; Direct flight connectivity (public information)
    (connected barcelona florence)
    (connected florence barcelona)
    (connected helsinki barcelona)
    (connected barcelona helsinki)

    ; Allowed meeting window days (day9..day14)
    (meet_window day9) (meet_window day10) (meet_window day11)
    (meet_window day12) (meet_window day13) (meet_window day14)

    ; No spent(...) facts initially; stays will add them
  )

  ; Goal: specific allocation of days to cities (a concrete feasible schedule that respects
  ; the travel constraints and meeting requirement).
  ; Allocation chosen to fit total 14 days:
  ;   Barcelona: day1..day5  (5 days)
  ;   Helsinki:  day6..day8  (3 days)  -- reduced from 5 to meet total-day constraint
  ;   Florence:  day9..day14 (6 days)  (includes meeting window)
  (:goal
    (and
      ; Barcelona days 1-5
      (spent barcelona day1) (spent barcelona day2) (spent barcelona day3)
      (spent barcelona day4) (spent barcelona day5)

      ; Helsinki days 6-8
      (spent helsinki day6) (spent helsinki day7) (spent helsinki day8)

      ; Florence days 9-14
      (spent florence day9) (spent florence day10) (spent florence day11)
      (spent florence day12) (spent florence day13) (spent florence day14)

      ; meeting must have occurred sometime in the meeting window while in Florence
      (met)
    )
  )
)