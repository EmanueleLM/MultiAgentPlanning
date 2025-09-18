(define (problem integrated-trip)
  (:domain integrated-travel)

  (:objects
    valencia amsterdam tallinn - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 day15 - day
    n0 n1 n2 n3 n4 n5 n6 n7 - count
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

    ;; count successor relations (dec n -> n-1)
    (dec n7 n6) (dec n6 n5) (dec n5 n4) (dec n4 n3)
    (dec n3 n2) (dec n2 n1) (dec n1 n0)

    ;; remaining required days for each city (precomputed arithmetic as predicates)
    ;; Original numeric setup: Valencia already spent 1 day, needs total 5 -> remaining 4
    ;; Amsterdam needs 5 -> remaining 5
    ;; Tallinn needs 7 (as in provided problem) -> remaining 7
    (remain valencia n4)
    (remain amsterdam n5)
    (remain tallinn n7)
  )

  (:goal
    (and
      ;; all days must be assigned (cover the 15-day trip)
      (assigned day1) (assigned day2) (assigned day3) (assigned day4) (assigned day5)
      (assigned day6) (assigned day7) (assigned day8) (assigned day9) (assigned day10)
      (assigned day11) (assigned day12) (assigned day13) (assigned day14) (assigned day15)

      ;; visit all three cities at least once
      (visited valencia) (visited amsterdam) (visited tallinn)

      ;; remaining counts reached zero (symbolic replacement of numeric equality)
      (remain valencia n0)
      (remain amsterdam n0)
      (remain tallinn n0)

      ;; ensure meeting occurs in the allowed window
      (metfriend)
    )
  )

  (:metric minimize (total-cost))
)