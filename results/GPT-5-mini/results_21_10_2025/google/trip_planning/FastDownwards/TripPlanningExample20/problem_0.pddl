(define (problem trip-12days)
  (:domain trip-scheduling)
  (:objects
    istanbul budapest dubrovnik - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 - day
  )

  (:init
    ;; Direct flights (as provided)
    (direct istanbul budapest)
    (direct budapest istanbul)
    (direct dubrovnik istanbul)

    ;; Starting location: must start in Dubrovnik so all cities are reachable using only given direct flights.
    (at dubrovnik)

    ;; All 12 day tokens are initially unallocated
    (unallocated day1) (unallocated day2) (unallocated day3) (unallocated day4)
    (unallocated day5) (unallocated day6) (unallocated day7) (unallocated day8) (unallocated day9)
    (unallocated day10) (unallocated day11) (unallocated day12)
  )

  ;; Goal: allocate exactly the allowed visit days so total = 12,
  ;; and per-city durations meet the traveler's strict and flexible-but-enforced reductions:
  ;; - Istanbul: 4 days (reduced from preferred 5)
  ;; - Budapest: 5 days (reduced from preferred 6)
  ;; - Dubrovnik: 3 days (strict)
  ;; We bind specific day tokens to cities to enforce exact counts and total days.
  (:goal (and
    ;; Istanbul: 4 days (day1..day4)
    (assigned day1 istanbul) (assigned day2 istanbul) (assigned day3 istanbul) (assigned day4 istanbul)

    ;; Budapest: 5 days (day5..day9)
    (assigned day5 budapest) (assigned day6 budapest) (assigned day7 budapest)
    (assigned day8 budapest) (assigned day9 budapest)

    ;; Dubrovnik: 3 days (day10..day12)
    (assigned day10 dubrovnik) (assigned day11 dubrovnik) (assigned day12 dubrovnik)
  ))
)