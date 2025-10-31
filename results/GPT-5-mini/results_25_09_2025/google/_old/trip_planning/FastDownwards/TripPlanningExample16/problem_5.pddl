(define (problem integrated-travel-problem)
  (:domain integrated-travel)

  (:objects
    prague vienna porto - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 - day
    c0 c1 c2 c3 c4 c5 c6 c7 c8 c9 - count
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

    (has-days prague c0)
    (has-days vienna c0)
    (has-days porto c0)

    (count-next c0 c1)
    (count-next c1 c2)
    (count-next c2 c3)
    (count-next c3 c4)
    (count-next c4 c5)
    (count-next c5 c6)
    (count-next c6 c7)
    (count-next c7 c8)
    (count-next c8 c9)

    (total-days c9)
  )

  (:goal (and
    (has-days prague c3)
    (has-days vienna c3)
    (has-days porto c5)
    (workshop-held)
    (total-days c9)
  ))
)