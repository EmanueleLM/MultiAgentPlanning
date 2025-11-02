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
    ;; Traveler's required stays (as specified): Venice 6 days, Mykonos 2 days, Vienna 4 days.
    ;; These demands collectively exceed the available 10 days (6+2+4=12) and therefore make the problem infeasible.
    ;; They are encoded here explicitly (resulting in an unsatisfiable goal given only 10 days).
    (at day1 venice)
    (at day2 venice)
    (at day3 venice)
    (at day4 venice)
    (at day5 venice)
    (at day6 venice)

    (at day7 mykonos)
    (at day8 mykonos)

    (at day1 vienna)
    (at day2 vienna)
    (at day9 vienna)
    (at day10 vienna)

    (workshop-done)
  ))
)