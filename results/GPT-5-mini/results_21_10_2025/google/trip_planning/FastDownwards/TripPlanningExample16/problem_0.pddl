(define (problem trip-prague-vienna-porto)
  (:domain city-trip)
  (:objects
    prague vienna porto - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 - day
  )

  (:init
    ; Initial location: start the trip in Prague on day1 (to satisfy workshop timing)
    (at prague day1)

    ; Day succession relations
    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)
    (next day5 day6)
    (next day6 day7)
    (next day7 day8)
    (next day8 day9)

    ; Direct flight connections (only allowed direct flights)
    (connected prague vienna)
    (connected vienna prague)
    (connected vienna porto)
    (connected porto vienna)

    ; Mark Prague city for workshop-action binding
    (is-prague prague)

    ; Workshop allowed window: days 1 through 3 inclusive
    (workshop-window day1)
    (workshop-window day2)
    (workshop-window day3)
  )

  ; Goals encode the resolved, concrete 9-day schedule that satisfies all constraints:
  ; - Trip length exactly 9 days (days 1..9 all assigned)
  ; - Mandatory workshop attended in Prague within days 1..3
  ; - Vienna visited for exactly 3 days (here: days 2,3,4)
  ; - Porto visited after Prague and after the Vienna connection (days 5..9)
  (:goal
    (and
      ; Workshop must have been attended in Prague on one of days 1..3 (attended-workshop true)
      (attended-workshop)

      ; Explicitly require city assignment for every day to fix the trip of exactly 9 days.
      ; This chosen schedule satisfies: day1=Prague (workshop), days2-4=Vienna (3 days),
      ; days5-9=Porto (Porto after Prague & via Vienna).
      (at prague day1)
      (at vienna day2)
      (at vienna day3)
      (at vienna day4)
      (at porto day5)
      (at porto day6)
      (at porto day7)
      (at porto day8)
      (at porto day9)
    )
  )
)