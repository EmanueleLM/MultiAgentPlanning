(define (problem trip10)
  (:domain travel)
  (:objects
    Mykonos Vienna Venice - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 - day
  )
  (:init
    ;; day succession
    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)
    (next day5 day6)
    (next day6 day7)
    (next day7 day8)
    (next day8 day9)
    (next day9 day10)

    ;; direct flight graph (bidirectional edges)
    (direct Mykonos Vienna)
    (direct Vienna Mykonos)
    (direct Vienna Venice)
    (direct Venice Vienna)

    ;; start location: chosen to enable feasible itinerary to Venice by day5
    (at day1 Mykonos)
    (visited Mykonos)

    ;; all subsequent days are initially unassigned (free)
    (free day2)
    (free day3)
    (free day4)
    (free day5)
    (free day6)
    (free day7)
    (free day8)
    (free day9)
    (free day10)
  )

  ;; Goals enforce hard constraints:
  ;; - Be in Venice on days 5 through 10 inclusive (workshop window)
  ;; - Visit all three cities at least once
  ;; - Ensure every day has been assigned (no remaining free days)
  (:goal (and
    (at day5 Venice)
    (at day6 Venice)
    (at day7 Venice)
    (at day8 Venice)
    (at day9 Venice)
    (at day10 Venice)

    (visited Mykonos)
    (visited Vienna)
    (visited Venice)

    (not (free day2))
    (not (free day3))
    (not (free day4))
    (not (free day5))
    (not (free day6))
    (not (free day7))
    (not (free day8))
    (not (free day9))
    (not (free day10))
  ))
)