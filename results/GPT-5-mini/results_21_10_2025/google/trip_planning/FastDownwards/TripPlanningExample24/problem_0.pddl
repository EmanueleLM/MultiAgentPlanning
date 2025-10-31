(define (problem trip-13days)
  (:domain trip-planner)

  ; No additional objects needed since domain-level constants are used.
  (:init
    ; Public environment direct flights (only these may be used)
    (direct-flight florence amsterdam)
    (direct-flight amsterdam florence)
    (direct-flight amsterdam riga)
    (direct-flight riga amsterdam)

    ; Note: initially no days are assigned and workshop not scheduled; the single scheduling action
    ; will assign days and set the workshop marker. No other facts are required.
  )

  (:goal (and
    ; Total trip duration exactly 13 days: every day 1..13 must be assigned (the scheduling action assigns them)
    (assigned day1) (assigned day2) (assigned day3) (assigned day4)
    (assigned day5) (assigned day6) (assigned day7) (assigned day8)
    (assigned day9) (assigned day10) (assigned day11) (assigned day12) (assigned day13)

    ; Each city is visited (Florence contiguous for 4 days, Riga contiguous for 5 days, Amsterdam contiguous for 4 days)
    (visited florence)
    (visited amsterdam)
    (visited riga)

    ; Workshop constraint: workshop must occur while in Florence and within days 1..4.
    ; The scheduling action guarantees this and sets this flag.
    (workshop-scheduled)
  ))

)