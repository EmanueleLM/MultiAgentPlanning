(define (problem trip-prague-vienna-porto)
  (:domain city-trip)
  (:objects
    prague vienna porto - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 - day
  )

  (:init
    ; Start the trip in Prague on day1 so the workshop constraint (day1-3) can be satisfied.
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

  ; Goal: enforce the high-level constraints without explicitly listing the full day->city assignment.
  ; The three 'mark-*-3' actions require occupying the specific day ranges; thus the only way to achieve
  ; these goal flags is to schedule the trip so Prague occupies days 1-3, Vienna days 4-6, and Porto days 7-9.
  (:goal
    (and
      (attended-workshop)
      (prague-visited-3)
      (vienna-visited-3)
      (porto-visited-3)
    )
  )
)