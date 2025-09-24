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

    (is-prague prague)

    (= (days-in prague) 0)
    (= (days-in vienna) 0)
    (= (days-in porto) 0)
  )

  (:goal (and
    (= (days-in prague) 3)
    (= (days-in vienna) 3)
    (= (days-in porto) 5)
    (= (+ (days-in prague) (days-in vienna) (days-in porto)) 9)
    (workshop-held)
  ))
)