(define (problem integrated-travel-problem)
  (:domain integrated-travel)

  (:objects
    prague vienna porto - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 - day
  )

  (:init
    (not-started)

    (direct prague vienna)
    (direct vienna prague)
    (direct vienna porto)
    (direct porto vienna)

    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)
    (next day5 day6)
    (next day6 day7)
    (next day7 day8)
    (next day8 day9)

    (first day1)

    (workshop-day day1)
    (workshop-day day2)
    (workshop-day day3)

    (between1and3 day1)
    (between1and3 day2)
    (between1and3 day3)

    (is-prague prague)

    (at prague)
    (current-day day1)
    (visited prague)
  )

  (:goal (and
    (visited prague)
    (visited vienna)
    (visited porto)
    (workshop-held)
    (workshop-done)
    (used-day day9)
    (current-day day9)
  ))
)