(define (problem integrated-travel-problem)
  (:domain integrated-travel)

  (:objects
    prague vienna porto - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 - day
  )

  (:init
    ;; Traveler timeline start marker
    (not-started)

    ;; Direct flight connectivity (bidirectional where allowed)
    (direct prague vienna)
    (direct vienna prague)
    (direct vienna porto)
    (direct porto vienna)
    ;; No direct prague <-> porto (explicitly absent)

    ;; Day ordering (shared)
    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)
    (next day5 day6)
    (next day6 day7)
    (next day7 day8)
    (next day8 day9)

    ;; First day marker for traveler start-in
    (first day1)

    ;; Workshop windows (both representations)
    (workshop-day day1)
    (workshop-day day2)
    (workshop-day day3)

    (between1and3 day1)
    (between1and3 day2)
    (between1and3 day3)

    ;; Mark Prague for flights-agent attend-workshop precondition
    (is-prague prague)

    ;; Flights-agent initial state: start at Prague on day1
    (at prague)
    (current-day day1)
    (visited prague)

    ;; Note: Traveler's at-day facts are not preset; traveler must use start-in to establish their day-indexed location.
    ;; This keeps the traveler's start-city choice flexible while still allowing the planner to choose/prune via start-in.

  )

  (:goal (and
    ;; Ensure all three cities are visited (shared visited predicate)
    (visited prague)
    (visited vienna)
    (visited porto)

    ;; Ensure workshop was executed in both representations (both agents' workshop flags)
    (workshop-held)
    (workshop-done)

    ;; Ensure both timelines reach day9
    (used-day day9)       ;; traveler timeline reaches day9
    (current-day day9)    ;; flights-agent timeline reaches day9
  ))
)