(define (problem trip-rome-barcelona-krakow)
  (:domain trip-planning)
  (:objects
    rome barcelona krakow - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 - day
  )
  (:init
    ;; initial presence: start in Rome on day1
    (at rome day1)
    (visited rome day1)

    ;; direct flight connectivity (only allowed transitions)
    (flight barcelona krakow)
    (flight krakow barcelona)
    (flight rome barcelona)
    (flight barcelona rome)

    ;; day successors (continuous timeline day1 -> day13)
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
  )

  ;; Goals encode the resolved feasible allocation that fits the 13-day limit
  ;; and ensures presence in Krakow during the meeting window.
  ;; Chosen feasible allocation (consistent with direct flights and 13 days total):
  ;; - Rome: day1..day3 (3 days)
  ;; - Barcelona: day4..day9 (6 days)
  ;; - Krakow: day10..day13 (4 days)  -- meeting window satisfied (earliest day10)
  (:goal
    (and
      ;; Rome presence days 1..3 (visited persists so we can check intermediate presence)
      (visited rome day1)
      (visited rome day2)
      (visited rome day3)

      ;; Barcelona presence days 4..9
      (visited barcelona day4)
      (visited barcelona day5)
      (visited barcelona day6)
      (visited barcelona day7)
      (visited barcelona day8)
      (visited barcelona day9)

      ;; Krakow presence days 10..13 (meeting window: earliest feasible day10 included)
      (visited krakow day10)
      (visited krakow day11)
      (visited krakow day12)
      (visited krakow day13)
    )
  )
)