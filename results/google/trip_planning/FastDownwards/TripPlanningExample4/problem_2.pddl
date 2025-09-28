(define (problem trip-planning-problem)
  (:domain trip-planning)
  (:objects
    seville munich tallinn - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 - day
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
    (next day11 day12)

    (at seville day1)

    (connected seville munich)
    (connected munich seville)
    (connected munich tallinn)
    (connected tallinn munich)

    (visited seville)
  )
  (:goal (and
    (visited seville)
    (visited munich)
    (visited tallinn)
    (or (at tallinn day11) (at tallinn day12))
  ))
)