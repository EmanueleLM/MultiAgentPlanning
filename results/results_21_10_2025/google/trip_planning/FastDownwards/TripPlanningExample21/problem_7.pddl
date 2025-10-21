(define (problem trip-problem)
  (:domain trip-planning)

  (:objects
    venice vienna mykonos - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 - day
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

    (connected venice vienna)
    (connected vienna venice)

    (connected vienna mykonos)
    (connected mykonos vienna)

    (eligible-workshop-day day5)
    (eligible-workshop-day day6)
    (eligible-workshop-day day7)
    (eligible-workshop-day day8)
    (eligible-workshop-day day9)
    (eligible-workshop-day day10)

    (start-day day1)

    (is-venice venice)
  )

  (:goal (and
    (at day1 venice)
    (at day2 venice)
    (at day3 venice)
    (at day4 venice)
    (at day5 venice)
    (at day6 venice)

    (at day7 vienna)
    (at day8 mykonos)
    (at day9 mykonos)
    (at day10 vienna)

    (workshop-done)
  ))
)