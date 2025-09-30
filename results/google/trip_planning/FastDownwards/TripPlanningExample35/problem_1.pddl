(define (problem TripPlanningExample35-problem)
  (:domain trip_planning)
  (:objects
    bucharest zurich dubrovnik - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 - day
  )
  (:init
    ;; day succession
    (next day1 day2) (next day2 day3) (next day3 day4) (next day4 day5) (next day5 day6)
    (next day6 day7) (next day7 day8) (next day8 day9) (next day9 day10)

    ;; direct flight connectivity (only direct flights allowed)
    (connected bucharest zurich) (connected zurich bucharest)
    (connected zurich dubrovnik) (connected dubrovnik zurich)

    ;; starting location (day1)
    (at bucharest day1)
  )
  ;; Reconciled desired stays to fit the 10-day limit while preserving the mandatory Dubrovnik window:
  ;; Bucharest 3 days (day1-day3), Zurich 2 days (day4-day5), Dubrovnik 5 days (day6-day10).
  (:goal (and
    (at bucharest day1) (at bucharest day2) (at bucharest day3)
    (at zurich day4) (at zurich day5)
    (at dubrovnik day6) (at dubrovnik day7) (at dubrovnik day8) (at dubrovnik day9) (at dubrovnik day10)
  ))
)