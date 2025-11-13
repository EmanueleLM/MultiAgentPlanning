(define (problem trip10)
  (:domain trip-planning)
  (:objects
    mykonos vienna venice - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 - day
  )
  (:init
    ;; day succession (ordered days 1..10)
    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)
    (next day5 day6)
    (next day6 day7)
    (next day7 day8)
    (next day8 day9)
    (next day9 day10)

    (first day1)

    ;; direct flight connectivity (bidirectional edges)
    (direct mykonos vienna)
    (direct vienna mykonos)
    (direct vienna venice)
    (direct venice vienna)

    ;; initially every day is unassigned (actions will assign exactly one city per day)
    (unassigned day1)
    (unassigned day2)
    (unassigned day3)
    (unassigned day4)
    (unassigned day5)
    (unassigned day6)
    (unassigned day7)
    (unassigned day8)
    (unassigned day9)
    (unassigned day10)

    ;; workshop window: days 5 through 10 inclusive must be in the workshop city (Venice)
    (workshop-day day5)
    (workshop-day day6)
    (workshop-day day7)
    (workshop-day day8)
    (workshop-day day9)
    (workshop-day day10)

    ;; designate Venice as the workshop city
    (workshop-city venice)
  )
  (:goal (and
    ;; Enforce the reconciled itinerary: days 5-10 in Venice (continuous workshop attendance),
    ;; and a complete per-day assignment visiting all three cities at least once.
    (at day1 mykonos)
    (at day2 mykonos)
    (at day3 vienna)
    (at day4 vienna)
    (at day5 venice)
    (at day6 venice)
    (at day7 venice)
    (at day8 venice)
    (at day9 venice)
    (at day10 venice)

    (visited mykonos)
    (visited vienna)
    (visited venice)
  ))
)