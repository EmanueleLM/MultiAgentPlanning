(define (problem trip-planning-instance)
  (:domain trip_planning)

  (:objects
    ;; cities
    manchester bucharest lyon - city

    ;; days 1..17
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10
    day11 day12 day13 day14 day15 day16 day17 - day
  )

  (:init
    ;; calendar start and successors
    (first_day day1)
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

    ;; all days initially free (can be assigned exactly once)
    (free day1)
    (free day2)
    (free day3)
    (free day4)
    (free day5)
    (free day6)
    (free day7)
    (free day8)
    (free day9)
    (free day10)
    (free day11)
    (free day12)
    (free day13)
    (free day14)
    (free day15)
    (free day16)
    (free day17)
  )

  (:goal
    (and
      ;; hard per-city day assignments as requested by the user
      ;; Manchester requested 7 days -> require Manchester on days 1..7
      (in_city manchester day1)
      (in_city manchester day2)
      (in_city manchester day3)
      (in_city manchester day4)
      (in_city manchester day5)
      (in_city manchester day6)
      (in_city manchester day7)

      ;; Bucharest requested 7 days -> require Bucharest on days 8..14
      (in_city bucharest day8)
      (in_city bucharest day9)
      (in_city bucharest day10)
      (in_city bucharest day11)
      (in_city bucharest day12)
      (in_city bucharest day13)
      (in_city bucharest day14)

      ;; Lyon requested 5 days and relatives visit between day13..day17 -> require Lyon on days 13..17
      (in_city lyon day13)
      (in_city lyon day14)
      (in_city lyon day15)
      (in_city lyon day16)
      (in_city lyon day17)

      ;; require the travel legs to be recorded on the corresponding departure days
      (travel_mb day7)   ;; Manchester->Bucharest at boundary day7->day8
      (travel_bl day14)  ;; Bucharest->Lyon at boundary day14->day15

      ;; ensure bookkeeping visited facts hold (will be set by assignment actions)
      (visited manchester)
      (visited bucharest)
      (visited lyon)
    )
  )
)