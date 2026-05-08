(define (problem trip-problem)
  (:domain travel-domain)

  (:objects
    traveler1 - person

    mykonos vienna venice - city

    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 - day
  )

  (:init
    ;; temporal ordering of days
    (succ day1 day2)
    (succ day2 day3)
    (succ day3 day4)
    (succ day4 day5)
    (succ day5 day6)
    (succ day6 day7)
    (succ day7 day8)
    (succ day8 day9)
    (succ day9 day10)

    ;; direct flight connectivity (only direct flights allowed)
    (flight mykonos vienna)
    (flight vienna mykonos)
    (flight vienna venice)
    (flight venice vienna)

    ;; initial location and occupancy marker for day1
    (at traveler1 mykonos day1)
    (has_loc traveler1 day1)
    (visited traveler1 mykonos)

    ;; workshop constraints: Venice is the workshop city and workshop must be attended between day5 and day10 inclusive
    (workshop_city venice)
    (allowed_workshop_day day5)
    (allowed_workshop_day day6)
    (allowed_workshop_day day7)
    (allowed_workshop_day day8)
    (allowed_workshop_day day9)
    (allowed_workshop_day day10)
  )

  (:goal
    (and
      ;; Every day must have an assigned location for the traveler (ensures day-by-day plan)
      (has_loc traveler1 day1)
      (has_loc traveler1 day2)
      (has_loc traveler1 day3)
      (has_loc traveler1 day4)
      (has_loc traveler1 day5)
      (has_loc traveler1 day6)
      (has_loc traveler1 day7)
      (has_loc traveler1 day8)
      (has_loc traveler1 day9)
      (has_loc traveler1 day10)

      ;; The workshop in Venice must be attended during the allowed window
      (workshop_done traveler1)

      ;; Ensure all three cities are visited at least once during the trip
      (visited traveler1 mykonos)
      (visited traveler1 vienna)
      (visited traveler1 venice)
    )
  )
)