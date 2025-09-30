(define (problem trip-9-days)
  (:domain travel)
  (:objects
    frankfurt florence valencia - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 - day
  )
  (:init
    (at valencia day1)
    (visited valencia)
  )
  (:goal (and
    (at valencia day1)
    (at valencia day2)

    (at frankfurt day3)
    (at frankfurt day4)
    (at frankfurt day5)
    (at frankfurt day6)
    (at frankfurt day7)

    (at florence day8)
    (at florence day9)

    (visited valencia)
    (visited frankfurt)
    (visited florence)
  ))
)