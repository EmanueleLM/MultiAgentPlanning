(define (problem trip-problem)
  (:domain trip-domain)

  (:objects
    traveler - agent
    dubrovnik istanbul venice - city

    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 - daytoken

    ;; Need tokens encode the resolved required stay counts:
    ;; Dubrovnik: 4 days -> need_d1..need_d4
    need_d1 need_d2 need_d3 need_d4 - needtoken
    ;; Istanbul: 2 days -> need_i1..need_i2
    need_i1 need_i2 - needtoken
    ;; Venice: 5 days -> need_v1..need_v5
    need_v1 need_v2 need_v3 need_v4 need_v5 - needtoken
  )

  (:init
    ;; Start location must allow visiting all cities respecting available direct flights.
    (at traveler dubrovnik)

    ;; Direct flights (only these are usable).
    (direct-flight dubrovnik istanbul)
    (direct-flight dubrovnik venice)
    (direct-flight istanbul venice)

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

    ;; Needs per city (these enforce the resolved per-city stays totaling 11):
    ;; Dubrovnik needs 4 days
    (need need_d1 dubrovnik)
    (need need_d2 dubrovnik)
    (need need_d3 dubrovnik)
    (need need_d4 dubrovnik)

    ;; Istanbul needs 2 days
    (need need_i1 istanbul)
    (need need_i2 istanbul)

    ;; Venice needs 5 days
    (need need_v1 venice)
    (need need_v2 venice)
    (need need_v3 venice)
    (need need_v4 venice)
    (need need_v5 venice)
  )

  ;; Goal: all city needs must be satisfied (consumed) and all day tokens allocated,
  ;; and each city must be visited at least once. This enforces the total-days
  ;; constraint and the per-city stay counts without hard-coding a sequence of allocations.
  (:goal
    (and
      ;; All cities must have been visited (allocate-day sets visited).
      (visited dubrovnik)
      (visited istanbul)
      (visited venice)

      ;; No unallocated day tokens remain (means all 11 days have been used).
      (not (unallocated day1))
      (not (unallocated day2))
      (not (unallocated day3))
      (not (unallocated day4))
      (not (unallocated day5))
      (not (unallocated day6))
      (not (unallocated day7))
      (not (unallocated day8))
      (not (unallocated day9))
      (not (unallocated day10))
      (not (unallocated day11))

      ;; All need tokens consumed (these negative literals enforce exact per-city day counts).
      (not (need need_d1 dubrovnik))
      (not (need need_d2 dubrovnik))
      (not (need need_d3 dubrovnik))
      (not (need need_d4 dubrovnik))

      (not (need need_i1 istanbul))
      (not (need need_i2 istanbul))

      (not (need need_v1 venice))
      (not (need need_v2 venice))
      (not (need need_v3 venice))
      (not (need need_v4 venice))
      (not (need need_v5 venice))
    )
  )
)