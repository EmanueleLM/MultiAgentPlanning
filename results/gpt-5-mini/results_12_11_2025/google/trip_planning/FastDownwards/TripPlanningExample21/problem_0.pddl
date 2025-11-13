(define (problem trip10)
  (:domain travel)
  (:objects
    Milan Rome Venice - city
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

    ;; direct flight graph (only the provided/required connections)
    (direct Milan Rome)
    (direct Rome Venice)

    ;; starting location and visit status
    (at day1 Milan)
    (visited Milan)

    ;; all subsequent days are initially unassigned (free) and must be assigned exactly once
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

  ;; Goals encode the reconciled itinerary exactly:
  ;; - Milan on days 1-2, Rome on days 3-4, Venice on days 5-10
  ;; - all three cities must be visited
  (:goal (and
    (at day1 Milan)
    (at day2 Milan)
    (at day3 Rome)
    (at day4 Rome)
    (at day5 Venice)
    (at day6 Venice)
    (at day7 Venice)
    (at day8 Venice)
    (at day9 Venice)
    (at day10 Venice)
    (visited Milan)
    (visited Rome)
    (visited Venice)
  ))
)