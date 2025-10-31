(define (problem trip-problem)
  (:domain trip-domain)
  (:objects
    traveler - agent
    venice dubrovnik istanbul - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 - daytoken
  )

  (:init
    ;; Starting location
    (at traveler venice)

    ;; Only these direct flights are available (use only direct flights provided).
    ;; The planner may use these flights to move between cities.
    (direct-flight venice dubrovnik)
    (direct-flight dubrovnik istanbul)

    ;; All day tokens initially unallocated.
    (unallocated day1)
    (unallocated day2)
    (unallocated day3)
    (unallocated day4)
    (unallocated day5)
    (unallocated day6)
    (unallocated day7)
    (unallocated day8)
    (unallocated day9)
    (unallocated day10)
    (unallocated day11)
  )

  ;; Hard constraints derived from agent preferences treated as strict:
  ;; Total days must be exactly 11, and the resolved per-city stays sum to 11.
  ;; Here we require:
  ;;  - Venice: 4 days  -> day1..day4
  ;;  - Dubrovnik: 3 days -> day5..day7
  ;;  - Istanbul: 4 days -> day8..day11
  ;; These allocations are required in the goal (exact counts and mapping).
  (:goal
    (and
      ;; Each city must be visited (allocation action also sets visited,
      ;; but include explicitly as a hard requirement).
      (visited venice)
      (visited dubrovnik)
      (visited istanbul)

      ;; Exact allocations of all 11 day tokens to enforce total_days = 11
      ;; and the resolved per-city stay durations.
      (allocated day1 venice)
      (allocated day2 venice)
      (allocated day3 venice)
      (allocated day4 venice)

      (allocated day5 dubrovnik)
      (allocated day6 dubrovnik)
      (allocated day7 dubrovnik)

      (allocated day8 istanbul)
      (allocated day9 istanbul)
      (allocated day10 istanbul)
      (allocated day11 istanbul)

      ;; Optionally require planner to finish in Istanbul to reflect final stop.
      (at traveler istanbul)
    )
  )
)