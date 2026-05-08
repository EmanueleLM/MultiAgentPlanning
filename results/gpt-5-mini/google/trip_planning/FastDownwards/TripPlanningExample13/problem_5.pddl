(define (problem trip-planning-instance)
  (:domain trip_planning)

  (:objects
    manchester bucharest lyon - city

    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10
    day11 day12 day13 day14 day15 day16 day17 - day
  )

  (:init
    ;; calendar successor relations
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

    ;; all days initially free
    (free day1) (free day2) (free day3) (free day4) (free day5)
    (free day6) (free day7) (free day8) (free day9) (free day10)
    (free day11) (free day12) (free day13) (free day14) (free day15)
    (free day16) (free day17)

    ;; direct flight connectivity (only the given direct links, bidirectional where applicable)
    (direct manchester bucharest)
    (direct bucharest manchester)
    (direct bucharest lyon)
    (direct lyon bucharest)
  )

  ;; The human's requests are encoded verbatim as hard goal constraints.
  ;; Note: these constraints are mutually inconsistent (overlap of days for bucharest and lyon),
  ;; so the encoding faithfully represents the impossible instance and will be unsolvable.
  (:goal
    (and
      ;; Manchester: 7 days (days 1..7)
      (day_at day1 manchester)
      (day_at day2 manchester)
      (day_at day3 manchester)
      (day_at day4 manchester)
      (day_at day5 manchester)
      (day_at day6 manchester)
      (day_at day7 manchester)

      ;; Bucharest: 7 days (days 8..14)
      (day_at day8 bucharest)
      (day_at day9 bucharest)
      (day_at day10 bucharest)
      (day_at day11 bucharest)
      (day_at day12 bucharest)
      (day_at day13 bucharest)
      (day_at day14 bucharest)

      ;; Lyon: 5 days and relatives must be visited between day13..day17 (days 13..17)
      (day_at day13 lyon)
      (day_at day14 lyon)
      (day_at day15 lyon)
      (day_at day16 lyon)
      (day_at day17 lyon)

      ;; required travel legs consistent with overnight flights implied by day boundaries
      (travel_leg manchester bucharest day7) ;; depart day7, arrive day8
      (travel_leg bucharest lyon day14)      ;; depart day14, arrive day15

      ;; record visits
      (visited manchester)
      (visited bucharest)
      (visited lyon)
    )
  )
)