(define (problem trip-problem)
  (:domain travel-domain)

  (:objects
    traveler1 - person

    home venice - city

    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 - day
  )

  (:init
    ; day succession chain (explicit 10-day horizon)
    (succ day1 day2)
    (succ day2 day3)
    (succ day3 day4)
    (succ day4 day5)
    (succ day5 day6)
    (succ day6 day7)
    (succ day7 day8)
    (succ day8 day9)
    (succ day9 day10)

    ; direct flight connectivity (only the provided direct connections are available)
    (flight home venice)
    (flight venice home)

    ; initial occupancy on day1
    (at traveler1 home day1)
    (has-loc traveler1 day1)

    ; allowed days for the Venice workshop: must occur between day5 and day10 inclusive
    (allowed-workshop-day day5)
    (allowed-workshop-day day6)
    (allowed-workshop-day day7)
    (allowed-workshop-day day8)
    (allowed-workshop-day day9)
    (allowed-workshop-day day10)
  )

  ; Goals: enforce that the traveler has a defined city for every day of the 10-day horizon
  ; and that the Venice workshop has been attended (once) on an allowed day.
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
    )
  )
)