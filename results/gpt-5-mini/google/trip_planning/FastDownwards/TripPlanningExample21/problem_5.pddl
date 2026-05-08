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

    ;; initial location on day1
    (at traveler1 mykonos day1)
    (has_loc traveler1 day1)
    (visited traveler1 mykonos)

    ;; workshop city and allowed workshop days (day5..day10 inclusive)
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
      ;; Require an assigned location for every day (ensures a complete day-by-day plan)
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

      ;; Workshop must be attended (on some allowed day while in Venice)
      (workshop_done traveler1)

      ;; Ensure each city is visited at least once
      (visited traveler1 mykonos)
      (visited traveler1 vienna)
      (visited traveler1 venice)

      ;; Traveler preferences encoded as hard goals (these preferences are collectively impossible
      ;; given the 10-day horizon; they are included here faithfully to the specification).
      ;; The traveler requested: Venice 6 days, Mykonos 2 days, Vienna 4 days.
      ;; We encode these as specific day assignments (this makes the instance unsatisfiable
      ;; because the requested totals sum to 12 > 10).
      ;; Venice required on 6 distinct days:
      (at traveler1 venice day1)
      (at traveler1 venice day2)
      (at traveler1 venice day3)
      (at traveler1 venice day4)
      (at traveler1 venice day5)
      (at traveler1 venice day6)

      ;; Mykonos required on 2 distinct days:
      (at traveler1 mykonos day7)
      (at traveler1 mykonos day8)

      ;; Vienna required on 4 distinct days:
      (at traveler1 vienna day3)
      (at traveler1 vienna day4)
      (at traveler1 vienna day9)
      (at traveler1 vienna day10)
    )
  )
)