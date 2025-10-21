(define (problem TripPlanningExample29-problem)
  (:domain travel-planning)

  (:objects
    traveler - agent
    dubrovnik frankfurt krakow - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 - day
  )

  (:init
    ;; day successor chain
    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)
    (next day5 day6)
    (next day6 day7)
    (next day7 day8)
    (next day8 day9)
    (next day9 day10)

    ;; direct-flight network (only allowed direct legs)
    (leg frankfurt krakow)
    (leg krakow frankfurt)
    (leg frankfurt dubrovnik)
    (leg dubrovnik frankfurt)

    ;; initial location and day occupancy (trip begins in Dubrovnik on day1)
    (at traveler dubrovnik day1)
    (occupied day1)
  )

  ;; Goal encodes the required feasible 10-day allocation that meets:
  ;; - total 10 days all assigned
  ;; - only direct flights can be used for inter-city moves (encoded in :init legs)
  ;; - wedding attendance in Krakow on days 9–10
  ;; The following ground atoms enforce the allocation so that any plan
  ;; satisfying them must follow the legal direct-flight moves and day-by-day progression.
  (:goal (and
    ;; Dubrovnik days 1-6
    (at traveler dubrovnik day1)
    (at traveler dubrovnik day2)
    (at traveler dubrovnik day3)
    (at traveler dubrovnik day4)
    (at traveler dubrovnik day5)
    (at traveler dubrovnik day6)

    ;; Frankfurt days 7-8
    (at traveler frankfurt day7)
    (at traveler frankfurt day8)

    ;; Krakow days 9-10 (covers the wedding between day9 and day10)
    (at traveler krakow day9)
    (at traveler krakow day10)

    ;; ensure every day 1..10 has been assigned (occupied)
    (occupied day1)
    (occupied day2)
    (occupied day3)
    (occupied day4)
    (occupied day5)
    (occupied day6)
    (occupied day7)
    (occupied day8)
    (occupied day9)
    (occupied day10)
  ))
)