(define (problem integrated-travel-problem)
  (:domain integrated-travel)

  (:objects
    prague vienna porto - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 - day
  )

  (:init
    (not-started)

    ;; Direct flight connections (bidirectional where available)
    (direct prague vienna)
    (direct vienna prague)
    (direct vienna porto)
    (direct porto vienna)

    ;; Day sequencing
    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)
    (next day5 day6)
    (next day6 day7)
    (next day7 day8)
    (next day8 day9)

    (first day1)

    ;; Workshop must be held between day1 and day3 (inclusive)
    (workshop-day day1)
    (workshop-day day2)
    (workshop-day day3)

    ;; Identify Prague
    (is-prague prague)
  )

  (:goal (and
    (visited prague)
    (visited vienna)
    (visited porto)
    (workshop-held)
    (used-day day1)
    (used-day day2)
    (used-day day3)
    (used-day day4)
    (used-day day5)
    (used-day day6)
    (used-day day7)
    (used-day day8)
    (used-day day9)
  ))
)