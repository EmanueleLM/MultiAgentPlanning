(define (problem traveler-itinerary-problem)
  (:domain traveler-itinerary)
  (:objects
    traveler1 - person

    home-city porto-city - city

    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 - day
  )

  (:init
    ;; Successor (ordered days 1..11)
    (trp-next day1 day2)
    (trp-next day2 day3)
    (trp-next day3 day4)
    (trp-next day4 day5)
    (trp-next day5 day6)
    (trp-next day6 day7)
    (trp-next day7 day8)
    (trp-next day8 day9)
    (trp-next day9 day10)
    (trp-next day10 day11)

    ;; Declared direct flights (only these flights are permitted by the specification).
    ;; These facts must reflect the declared direct flight connectivity. No other flights exist.
    (trp-direct-flight home-city porto-city)
    (trp-direct-flight porto-city home-city)

    ;; Initial occupancy: traveler is in home-city on day1.
    (trp-at traveler1 home-city day1)

    ;; Day1 occupancy is assigned initially (starting condition).
    (trp-assigned day1)

    ;; No other day is assigned in the initial state (they will be assigned by actions).
    ;; (Absence of trp-assigned for day2..day11 enforces that they must be achieved through actions.)
  )

  ;; Goals:
  ;; - Every day from day1 through day11 must have its occupancy assigned (ensures a contiguous, complete itinerary).
  ;; - The traveler must be in Porto on day6 to attend the wedding (strict, non-negotiable).
  (:goal
    (and
      ;; Wedding attendance constraint: traveler must be in Porto for day6.
      (trp-at traveler1 porto-city day6)

      ;; Full schedule assigned across the 11-day horizon (enforces that each day's location has been set).
      (trp-assigned day1)
      (trp-assigned day2)
      (trp-assigned day3)
      (trp-assigned day4)
      (trp-assigned day5)
      (trp-assigned day6)
      (trp-assigned day7)
      (trp-assigned day8)
      (trp-assigned day9)
      (trp-assigned day10)
      (trp-assigned day11)
    )
  )
)