(define (problem integrated_trip_14_days)
  (:domain integrated_trip_direct_flights)

  (:objects
    amsterdam santorini istanbul - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 - day
  )

  (:init
    ;; Day succession for a 14-day trip
    (next day1 day2) (next day2 day3) (next day3 day4) (next day4 day5)
    (next day5 day6) (next day6 day7) (next day7 day8) (next day8 day9)
    (next day9 day10) (next day10 day11) (next day11 day12) (next day12 day13)
    (next day13 day14)

    ;; Direct flight connections (only direct flights are allowed)
    (direct amsterdam santorini)
    (direct santorini amsterdam)
    (direct amsterdam istanbul)
    (direct istanbul amsterdam)

    ;; City identity facts (for agent1 predicates)
    (is-amsterdam amsterdam)
    (is-santorini santorini)
    (is-istanbul istanbul)

    ;; Start the integrated trip in Amsterdam on day1 (chosen to satisfy the
    ;; 7-day Amsterdam stay and allow reaching Santorini by day12 via Amsterdam).
    (at amsterdam day1)

    ;; Agent2 optional start choices (kept, but not required - a2_start_in can be unused)
    (will-start amsterdam)
    (will-start istanbul)
  )

  ;; Goals:
  ;; - satisfy agent1: stayed in Amsterdam for 7 days (represented by the predicate)
  ;; - satisfy agent2: be at Santorini on day12, day13 and day14 and record a relatives visit in that window
  ;; - mark both kinds of "visited relatives" predicates so both agent1 and agent2 goals are met
  (:goal
    (and
      (stayed-amsterdam)
      (at santorini day12)
      (at santorini day13)
      (at santorini day14)
      (visited-relatives-santorini)
      (relatives-visited-any)
    )
  )
)