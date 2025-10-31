(define (problem travel-problem)
  (:domain travel-domain)

  ;;; Assumptions and minimal, explicit adjustments (documented):
  ;; 1) The traveler is represented by the single agent "traveler".
  ;; 2) The traveler starts in Amsterdam on day1. This is a minimal explicit
  ;;    assumption required because no explicit start location was provided
  ;;    in the descriptive inputs, and Amsterdam is the only hub connecting
  ;;    to the other cities by the allowed direct flights.
  ;; 3) Each flight or stay takes one day (an action moves the agent from day d to day d+1).
  ;;    This is an explicit modeling choice to represent a day-by-day schedule.
  ;; 4) Only the direct flights listed in the domain are available:
  ;;    Amsterdam <-> Santorini and Amsterdam <-> Istanbul. There is no
  ;;    direct Santorini <-> Istanbul flight (travel between them requires Amsterdam).
  ;; 5) The hard requirement from the traveler: be in Santorini on days 12, 13, and 14.
  ;;    This is encoded as a goal (strict constraint) and must hold in any plan.
  ;; 6) No other preferences or unavailable slots were provided; no additional
  ;;    availability was invented beyond the specified horizon, cities, and connections.
  ;;

  (:objects
    traveler - agent
    amsterdam santorini istanbul - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 - day
  )

  (:init
    ;; day successor relation (one-day steps)
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
    (next day11 day12)
    (next day12 day13)
    (next day13 day14)

    ;; Initial location (explicit minimal assumption)
    (at traveler amsterdam day1)
  )

  ;; Hard temporal constraint: traveler must be in Santorini on days 12-14 (inclusive).
  ;; These are strict (must hold in the final state).
  (:goal
    (and
      (at traveler santorini day12)
      (at traveler santorini day13)
      (at traveler santorini day14)
    )
  )
)