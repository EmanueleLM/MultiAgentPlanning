(define (problem integrated-trip-problem)
  (:domain integrated_trip)

  (:objects
    vienna vilnius valencia - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 day15 day16 - day

    sv1 sv2 sv3 sv4 sv5 - token
    svil1 svil2 svil3 svil4 svil5 - token
    sval1 sval2 sval3 sval4 sval5 - token
  )

  (:init
    (current-day day1)
    (at vienna)

    (direct vienna valencia)
    (direct valencia vienna)
    (direct vienna vilnius)
    (direct vilnius vienna)

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

    ;; Tokens precomputed to encode required stays; totals adjusted to match 15 days
    (for-city sv1 vienna)
    (for-city sv2 vienna)
    (for-city sv3 vienna)
    (for-city sv4 vienna)
    (for-city sv5 vienna)

    (for-city svil1 vilnius)
    (for-city svil2 vilnius)
    (for-city svil3 vilnius)
    (for-city svil4 vilnius)
    (for-city svil5 vilnius)

    (for-city sval1 valencia)
    (for-city sval2 valencia)
    (for-city sval3 valencia)
    (for-city sval4 valencia)
    (for-city sval5 valencia)
  )

  (:goal
    (and
      (consumed sv1) (consumed sv2) (consumed sv3) (consumed sv4) (consumed sv5)
      (consumed svil1) (consumed svil2) (consumed svil3) (consumed svil4) (consumed svil5)
      (consumed sval1) (consumed sval2) (consumed sval3) (consumed sval4) (consumed sval5)
      (attended9)
      (attended15)
      (current-day day16)
    )
  )
)