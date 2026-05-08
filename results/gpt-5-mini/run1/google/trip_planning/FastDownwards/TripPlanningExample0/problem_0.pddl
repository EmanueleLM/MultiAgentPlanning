(define (problem travel-14days-problem)
  (:domain travel-14days)
  (:objects
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 - day
    london paris munich venice florence rome - city
  )

  (:init
    ;; successor chain for days 1..14
    (day-succ day1 day2)
    (day-succ day2 day3)
    (day-succ day3 day4)
    (day-succ day4 day5)
    (day-succ day5 day6)
    (day-succ day6 day7)
    (day-succ day7 day8)
    (day-succ day8 day9)
    (day-succ day9 day10)
    (day-succ day10 day11)
    (day-succ day11 day12)
    (day-succ day12 day13)
    (day-succ day13 day14)

    ;; mark Florence window: at least one of these days must be Florence to satisfy
    ;; the auditor's requirement (day9..day14)
    (florence-window day9)
    (florence-window day10)
    (florence-window day11)
    (florence-window day12)
    (florence-window day13)
    (florence-window day14)

    ;; mark which city object is Florence
    (city-florence florence)

    ;; initial location: traveler is in London on day1 (start)
    (in-city london day1)
    (assigned day1)

    ;; Direct flights (only these connections are allowed). All listed flights are bidirectional.
    (direct-flight london paris)
    (direct-flight paris london)

    (direct-flight paris munich)
    (direct-flight munich paris)

    (direct-flight munich venice)
    (direct-flight venice munich)

    (direct-flight venice florence)
    (direct-flight florence venice)

    (direct-flight florence rome)
    (direct-flight rome florence)

    (direct-flight rome paris)
    (direct-flight paris rome)

    (direct-flight munich rome)
    (direct-flight rome munich)

    (direct-flight venice rome)
    (direct-flight rome venice)
  )

  (:goal (and
    ;; enforce that every day 1..14 has been assigned a city (this enforces total length 14)
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
    (assigned day11)
    (assigned day12)
    (assigned day13)
    (assigned day14)

    ;; enforce the auditor's requested constraint: some day between 9 and 14 must be Florence
    (florence-met)
  ))
)