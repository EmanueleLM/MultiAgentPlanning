(define (problem trip-problem)
  (:domain travel-domain)

  (:objects
    traveler1 - person

    mykonos vienna venice - city

    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 - day
  )

  (:init
    ;; day succession chain (explicit 10-day horizon)
    (succ day1 day2)
    (succ day2 day3)
    (succ day3 day4)
    (succ day4 day5)
    (succ day5 day6)
    (succ day6 day7)
    (succ day7 day8)
    (succ day8 day9)
    (succ day9 day10)

    ;; direct flight connectivity (bidirectional where provided)
    (flight mykonos vienna)
    (flight vienna mykonos)
    (flight vienna venice)
    (flight venice vienna)

    ;; initial occupancy: traveler starts in Mykonos on day1
    (at traveler1 mykonos day1)
    (has-loc traveler1 day1)
    (visited traveler1 mykonos)

    ;; allowed days for the Venice workshop: day5..day10 inclusive
    (allowed-workshop-day day5)
    (allowed-workshop-day day6)
    (allowed-workshop-day day7)
    (allowed-workshop-day day8)
    (allowed-workshop-day day9)
    (allowed-workshop-day day10)
  )

  ;; Goals:
  ;; - traveler has an assigned city for every day of the 10-day horizon
  ;; - workshop in Venice has been attended (once) on an allowed day
  ;; - traveler must visit each of the three cities at least once during the trip
  (:goal
    (and
      (has-loc traveler1 day1)
      (has-loc traveler1 day2)
      (has-loc traveler1 day3)
      (has-loc traveler1 day4)
      (has-loc traveler1 day5)
      (has-loc traveler1 day6)
      (has-loc traveler1 day7)
      (has-loc traveler1 day8)
      (has-loc traveler1 day9)
      (has-loc traveler1 day10)

      (workshop-done traveler1)

      (visited traveler1 mykonos)
      (visited traveler1 vienna)
      (visited traveler1 venice)
    )
  )
)