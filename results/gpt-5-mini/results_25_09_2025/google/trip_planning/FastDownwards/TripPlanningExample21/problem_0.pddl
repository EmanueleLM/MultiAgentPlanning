(define (problem ten-day-europe-trip)
  (:domain trip-planning-multiagent)
  (:objects
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 - day
    venice mykonos vienna - city
  )

  (:init
    ;; first day
    (first-day day1)

    ;; previous-day relations
    (previous day2 day1)
    (previous day3 day2)
    (previous day4 day3)
    (previous day5 day4)
    (previous day6 day5)
    (previous day7 day6)
    (previous day8 day7)
    (previous day9 day8)
    (previous day10 day9)

    ;; workshop window days day5..day10
    (workshop-window day5)
    (workshop-window day6)
    (workshop-window day7)
    (workshop-window day8)
    (workshop-window day9)
    (workshop-window day10)

    ;; direct flights (flight_agent private/public info)
    ;; Direct flights exist between Mykonos and Vienna
    (direct-flight mykonos vienna)
    (direct-flight vienna mykonos)
    ;; Direct flights exist between Vienna and Venice
    (direct-flight vienna venice)
    (direct-flight venice vienna)
    ;; No direct flight exists between Mykonos and Venice (so not listed)

    ;; counters initialized to 0
    (= (count-venice) 0)
    (= (count-mykonos) 0)
    (= (count-vienna) 0)
  )

  ;; Goal:
  ;; - All 10 days must be assigned (so total trip is exactly 10 days).
  ;; - Workshop attended (requires being in Venice on some day in day5..day10).
  ;; - Each city visited at least once (visited-X flags are set when an assignment action runs).
  (:goal (and
    (assigned day1)
    (assigned day2)
    (assigned day3)
    (assigned day4)
    (assigned day5)
    (assigned day6)
    (assigned day7)
    (assigned day8)
    (assigned day9)
    (assigned day10)
    (workshop-attended)
    (visited-venice)
    (visited-mykonos)
    (visited-vienna)
  ))
)