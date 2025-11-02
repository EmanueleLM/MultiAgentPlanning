(define (problem trip-12days)
  (:domain trip-scheduling)

  (:objects
    istanbul budapest dubrovnik - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 - day
  )

  (:init
    ;; Direct flights (as provided by flight agent)
    (direct istanbul budapest)
    (direct budapest istanbul)
    (direct dubrovnik istanbul)

    ;; Start location chosen so all needed visits are reachable using only direct flights.
    (at dubrovnik)

    ;; All 12 day tokens are initially unallocated
    (unallocated day1) (unallocated day2) (unallocated day3) (unallocated day4)
    (unallocated day5) (unallocated day6) (unallocated day7) (unallocated day8)
    (unallocated day9) (unallocated day10) (unallocated day11) (unallocated day12)
  )

  ;; Goal: enforce the trip uses exactly 12 days in total and meets the per-city day counts
  ;; that were deduced to fit the 12-day limit while respecting direct-flight connectivity.
  ;; (These goals force allocation of exactly the required number of day tokens to each city.
  ;; The planner must perform the travel actions permitted by direct flights in order to enable
  ;; allocate-day actions for the respective cities.)
  (:goal (and
    ;; Dubrovnik: 3 days
    (assigned day1 dubrovnik) (assigned day2 dubrovnik) (assigned day3 dubrovnik)

    ;; Istanbul: 4 days
    (assigned day4 istanbul) (assigned day5 istanbul) (assigned day6 istanbul) (assigned day7 istanbul)

    ;; Budapest: 5 days
    (assigned day8 budapest) (assigned day9 budapest) (assigned day10 budapest)
    (assigned day11 budapest) (assigned day12 budapest)
  ))
)