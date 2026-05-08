(define (problem trip-15days)
  (:domain trip_planning)

  (:objects
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 day15 - day
    vienna vilnius valencia - city
  )

  (:init
    ;; successor links for days 1..15 (nights 1..14)
    (succ day1 day2) (succ day2 day3) (succ day3 day4) (succ day4 day5)
    (succ day5 day6) (succ day6 day7) (succ day7 day8) (succ day8 day9)
    (succ day9 day10) (succ day10 day11) (succ day11 day12) (succ day12 day13)
    (succ day13 day14) (succ day14 day15)

    ;; direct flights available (bidirectional)
    (direct vienna valencia)
    (direct valencia vienna)
    (direct vilnius vienna)
    (direct vienna vilnius)

    ;; starting location: day1 in Vilnius
    (at day1 vilnius)
    (assigned day1)
  )

  ;; Feasible itinerary encoded as a goal that fits into 15 days and ensures presence
  ;; in Valencia on conference days (day9 and day15). Note: original preferred stays
  ;; (vienna 5, vilnius 5, valencia 7) sum to 17 > 15 and are infeasible; the goal
  ;; below encodes a realizable allocation that respects direct-flight constraints
  ;; and conference attendance:
  ;; Vilnius: days 1-5 (5 days)
  ;; Vienna: days 6-8 (3 days)
  ;; Valencia: days 9-15 (7 days; conferences on days 9 and 15)
  (:goal (and
    ;; Vilnius days 1-5
    (at day1 vilnius)
    (at day2 vilnius)
    (at day3 vilnius)
    (at day4 vilnius)
    (at day5 vilnius)

    ;; Vienna days 6-8
    (at day6 vienna)
    (at day7 vienna)
    (at day8 vienna)

    ;; Valencia days 9-15 (must be present for conferences on day9 and day15)
    (at day9 valencia)
    (at day10 valencia)
    (at day11 valencia)
    (at day12 valencia)
    (at day13 valencia)
    (at day14 valencia)
    (at day15 valencia)
  ))
)