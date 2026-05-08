(define (problem trip_10_days_instance)
  (:domain jack_of_all_trades)
  (:objects
    traveler - person
    reykjavik riga paris - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 - day
  )

  (:init
    ;; traveler exists
    (traveler_exists traveler)

    ;; day ordering chain
    (next_day day1 day2)
    (next_day day2 day3)
    (next_day day3 day4)
    (next_day day4 day5)
    (next_day day5 day6)
    (next_day day6 day7)
    (next_day day7 day8)
    (next_day day8 day9)
    (next_day day9 day10)

    ;; direct flights (both directions explicitly stated)
    (flight paris reykjavik)
    (flight reykjavik paris)
    (flight riga paris)
    (flight paris riga)
  )

  (:goal
    (and
      ;; every day must be assigned to some city
      (assigned day1)
      (assigned day2)
      (assigned day3)
      (assigned day4)
      (assigned day5)
      (assigned day6)
      (assigned day7)
      (assigned day8)
      (assigned day9)
      (assigned day10)

      ;; mandatory attendance at Reykjavik for days 6-10 (annual show)
      (at reykjavik day6)
      (at reykjavik day7)
      (at reykjavik day8)
      (at reykjavik day9)
      (at reykjavik day10)

      ;; visit-duration hard requirements encoded as explicit per-day occupancy
      ;; "You would like to visit Riga for 3 days."
      ;; Grounded here as occupying three specific days (day1..day3).
      (at riga day1)
      (at riga day2)
      (at riga day3)

      ;; "You would like to visit Paris for 4 days."
      ;; Grounded here as occupying four specific days (day4..day7).
      (at paris day4)
      (at paris day5)
      (at paris day6)
      (at paris day7)
    )
  )
)