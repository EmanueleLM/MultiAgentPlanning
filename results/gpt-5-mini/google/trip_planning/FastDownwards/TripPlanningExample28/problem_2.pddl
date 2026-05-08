(define (problem trip-instance-28)
  (:domain trip-planning)

  ;; Auditor/orchestrator assumptions (kept as comments):
  ;; - Original wishes (venice:6, florence:6, zurich:2) summed to 14 > total 12.
  ;;   Minimal conservative reconciliation used here: venice=5, zurich=2, florence=5 (sum=12).
  ;; - Trip starts in venice on day1 to make the given flight network usable.
  ;; - Days are discrete objects day1..day12. Each day (except day1 which is initialized)
  ;;   must be produced by a fly or stay action to establish the traveler's city that day.

  (:objects
    venice florence zurich - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 - day
  )

  (:init
    ;; day ordering (successor links)
    (succ day1 day2) (succ day2 day3) (succ day3 day4) (succ day4 day5)
    (succ day5 day6) (succ day6 day7) (succ day7 day8) (succ day8 day9)
    (succ day9 day10) (succ day10 day11) (succ day11 day12)

    ;; start location (assumed conservatively)
    (at venice day1)

    ;; direct flights as specified by the route planner
    (directflight venice zurich)
    (directflight zurich venice)   ; bidirectional between venice and zurich
    (directflight zurich florence) ; direct flight from zurich to florence
  )

  ;; Goals: require traveller to be in specified cities on each day according to the reconciliation:
  ;; venice d1..d5 (5 days), zurich d6..d7 (2 days), florence d8..d12 (5 days).
  ;; By requiring (at ...) positively for each day we avoid negative goals.
  (:goal (and
    ;; venice: day1..day5
    (at venice day1) (at venice day2) (at venice day3) (at venice day4) (at venice day5)

    ;; zurich: day6..day7
    (at zurich day6) (at zurich day7)

    ;; florence: day8..day12
    (at florence day8) (at florence day9) (at florence day10) (at florence day11) (at florence day12)
  ))
)