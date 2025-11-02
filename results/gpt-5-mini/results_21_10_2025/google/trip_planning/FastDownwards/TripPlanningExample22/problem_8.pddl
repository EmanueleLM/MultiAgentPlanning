(define (problem trip-berlin-frankfurt-bucharest)
  (:domain trip-planning)

  (:objects
    traveler - person
    berlin frankfurt bucharest - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 - day
  )

  (:init
    ;; initial location on day1
    (at traveler berlin day1)

    ;; day ordering
    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)
    (next day5 day6)
    (next day6 day7)
    (next day7 day8)
    (next day8 day9)
    (next day9 day10)
    (next day10 day11)

    ;; direct flight connections (only direct flights allowed)
    (connected berlin frankfurt)
    (connected frankfurt berlin)
    (connected frankfurt bucharest)
    (connected bucharest frankfurt)
  )

  ;; Goals encode the hard constraints from the specification:
  ;; - Presence in Berlin on days 1..7 for the annual show (7 days)
  ;; - Requested stays: Frankfurt 4 days, Bucharest 2 days
  ;; Note: With Berlin occupying days 1..7, only days 8..11 remain (4 days).
  ;; Requiring Frankfurt 4 days and Bucharest 2 days in addition to Berlin is therefore unsatisfiable;
  ;; the goal below faithfully encodes the agents' requested stays (and will make the problem unsolvable).
  (:goal
    (and
      ;; Berlin event attendance days 1..7
      (at traveler berlin day1)
      (at traveler berlin day2)
      (at traveler berlin day3)
      (at traveler berlin day4)
      (at traveler berlin day5)
      (at traveler berlin day6)
      (at traveler berlin day7)

      ;; Frankfurt requested 4 days (encoded as days 8..11)
      (at traveler frankfurt day8)
      (at traveler frankfurt day9)
      (at traveler frankfurt day10)
      (at traveler frankfurt day11)

      ;; Bucharest requested 2 days (encoded as days 9..10)
      (at traveler bucharest day9)
      (at traveler bucharest day10)
    )
  )
)