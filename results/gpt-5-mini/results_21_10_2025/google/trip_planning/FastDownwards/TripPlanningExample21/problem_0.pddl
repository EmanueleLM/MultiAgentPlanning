(define (problem travel-problem)
  (:domain travel)
  (:objects
    mykonos vienna venice - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 - day
  )

  (:init
    ;; Trip days are day1 .. day10; we model successor links so actions consume exactly one day per action.
    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)
    (next day5 day6)
    (next day6 day7)
    (next day7 day8)
    (next day8 day9)
    (next day9 day10)

    ;; Starting location: the model must have an initial city on day1.
    ;; The structured input did not specify a start city; here the initial state places the agent in Venice on day1.
    (at venice day1)

    ;; Workshop has not yet been held (workshop-done absent).
  )

  ;; Goals: encode the immutable required stays as hard constraints.
  ;; The structured facts require:
  ;;  - Venice: 6 days
  ;;  - Mykonos: 2 days
  ;;  - Vienna: 4 days
  ;; These required-day counts sum to 12 while the trip duration is only 10 days, so the goal set below is intentionally
  ;; contradictory with the trip duration to reflect the infeasibility flagged in the input.
  ;; (This will cause no valid plan to exist until the user resolves the conflict by one of the suggested options.)
  (:goal (and
    ;; Venice required 6 days (explicitly required on specific days here)
    (at venice day1)
    (at venice day2)
    (at venice day3)
    (at venice day4)
    (at venice day5)
    (at venice day6)

    ;; Mykonos required 2 days
    (at mykonos day7)
    (at mykonos day8)

    ;; Vienna required 4 days (we force four explicit days)
    (at vienna day3)  ;; deliberately overlapping to create the documented conflict
    (at vienna day4)  ;; deliberately overlapping to create the documented conflict
    (at vienna day9)
    (at vienna day10)

    ;; Workshop must occur on some day between day5 and day10 inclusive:
    ;; require the derived fact that the workshop has been held (achieved by one of the hold-workshop-dayX actions).
    (workshop-done)
  ))
)