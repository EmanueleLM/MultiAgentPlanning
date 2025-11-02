(define (problem trip-problem)
  (:domain trip-planning)

  (:objects
    venice vienna mykonos - city
    day0 day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 - day
  )

  (:init
    (next day0 day1)
    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)
    (next day5 day6)
    (next day6 day7)
    (next day7 day8)
    (next day8 day9)
    (next day9 day10)

    (at venice day0)
    (current-day day1)

    (connected venice venice)
    (connected vienna vienna)
    (connected mykonos mykonos)

    (connected mykonos vienna)
    (connected vienna mykonos)

    (connected vienna venice)
    (connected venice vienna)

    (is-venice venice)

    (eligible-workshop-day day5)
    (eligible-workshop-day day6)
    (eligible-workshop-day day7)
    (eligible-workshop-day day8)
    (eligible-workshop-day day9)
    (eligible-workshop-day day10)
  )

  (:goal (and
    (at venice day1)
    (at venice day2)
    (at venice day3)
    (at venice day4)
    (at venice day5)
    (at venice day6)

    (at vienna day7)
    (at mykonos day8)
    (at mykonos day9)
    (at vienna day10)

    (workshop-done)
  ))
)