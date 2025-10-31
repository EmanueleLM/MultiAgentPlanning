(define (problem visit-venice-porto-dublin-10days)
  (:domain trip-planning)
  (:objects
    venice dublin porto - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 - day
  )

  (:init
    ;; initial location
    (at venice day1)

    ;; day successor relations
    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)
    (next day5 day6)
    (next day6 day7)
    (next day7 day8)
    (next day8 day9)
    (next day9 day10)

    ;; direct flight network (bidirectional where specified)
    (direct dublin porto)
    (direct porto dublin)
    (direct venice dublin)
    (direct dublin venice)
    ;; Note: No direct venice-porto facts provided (no direct flight)
  )

  ;; Goal encodes the resolved schedule:
  ;; Venice days1-4, Dublin days5-6 (reduced), Porto days7-10
  (:goal
    (and
      (at venice day1)
      (at venice day2)
      (at venice day3)
      (at venice day4)

      (at dublin day5)
      (at dublin day6)

      (at porto day7)
      (at porto day8)
      (at porto day9)
      (at porto day10)
    )
  )
)