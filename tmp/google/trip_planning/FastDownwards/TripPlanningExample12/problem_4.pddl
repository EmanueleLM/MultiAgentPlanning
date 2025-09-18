(define (problem integrated-trip)
  (:domain integrated-travel)

  (:objects
    valencia amsterdam tallinn - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 day15 - day
  )

  (:init
    ;; flights (direct, both directions)
    (flight valencia amsterdam)
    (flight amsterdam valencia)
    (flight amsterdam tallinn)
    (flight tallinn amsterdam)

    ;; day ordering
    (next day1 day2) (next day2 day3) (next day3 day4) (next day4 day5)
    (next day5 day6) (next day6 day7) (next day7 day8) (next day8 day9)
    (next day9 day10) (next day10 day11) (next day11 day12) (next day12 day13)
    (next day13 day14) (next day14 day15)

    ;; start location and first day assigned
    (at valencia day1)
    (assigned day1)
    (visited valencia)

    ;; identify tallinn for meeting action
    (is_tallinn tallinn)

    ;; meeting allowed days (between day9 and day15 inclusive)
    (meet_allowed day9) (meet_allowed day10) (meet_allowed day11)
    (meet_allowed day12) (meet_allowed day13) (meet_allowed day14) (meet_allowed day15)

    ;; numeric counters: count the first day spent in Valencia
    (= (days_spent valencia) 1)
    (= (days_spent amsterdam) 0)
    (= (days_spent tallinn) 0)
  )

  (:goal
    (and
      ;; all days must be assigned (cover the 15-day trip)
      (assigned day1) (assigned day2) (assigned day3) (assigned day4) (assigned day5)
      (assigned day6) (assigned day7) (assigned day8) (assigned day9) (assigned day10)
      (assigned day11) (assigned day12) (assigned day13) (assigned day14) (assigned day15)

      ;; visit all three cities at least once
      (visited valencia) (visited amsterdam) (visited tallinn)

      ;; respect agents' private desires (numeric exact day counts)
      (= (days_spent valencia) 5)
      (= (days_spent amsterdam) 5)
      (= (days_spent tallinn) 7)

      ;; ensure meeting occurs in the allowed window
      (metfriend)
    )
  )
)