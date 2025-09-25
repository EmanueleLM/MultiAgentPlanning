(define (problem trip-problem)
  (:domain trip-planning)
  (:objects
    vienna vilnius valencia - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 day15 - day
  )

  (:init
    ;; Trip not yet started; a start action will choose the actual starting city
    (not-started)

    ;; Direct flight connectivity (provided by flight_network agent public info)
    ;; Flights are modeled bidirectionally (network supports both directions where public info implied connectivity)
    (direct-flight vienna valencia)
    (direct-flight valencia vienna)
    (direct-flight vilnius vienna)
    (direct-flight vienna vilnius)

    ;; Day succession relations
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
  )

  ;; Goals:
  ;; - Trip lasts exactly 15 days (current day must be day15)
  ;; - Must be in Valencia on day9 and on day15 (conference attendance requirements)
  ;; - Must visit each of the three listed cities at least one day
  (:goal (and
    (current day15)
    (at-day valencia day9)
    (at-day valencia day15)
    (visited vienna)
    (visited vilnius)
    (visited valencia)
  ))
)