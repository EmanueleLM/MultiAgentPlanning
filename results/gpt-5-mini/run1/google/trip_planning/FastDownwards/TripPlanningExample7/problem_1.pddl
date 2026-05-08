(define (problem travel-problem-dbv-vce-ist-11days)
  (:domain travel-domain)
  (:objects
    dbv vce ist - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 - day
  )

  (:init
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

    (direct dbv vce)
    (direct dbv ist)

    (at dbv day1)
    (occupied day1)
    (visited dbv)
  )

  (:goal (and
    (visited dbv)
    (visited vce)
    (visited ist)
  ))
)