(define (problem trip-problem)
  (:domain trip-domain)
  (:objects
    traveler - agent
    reykjavik vienna venice - city
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

    (direct reykjavik vienna)
    (direct vienna reykjavik)
    (direct vienna venice)
    (direct venice vienna)

    (at traveler reykjavik day1)

    (wedding_day day8)
    (wedding_day day9)
    (wedding_day day10)
    (wedding_day day11)

    (is-venice venice)
  )

  (:goal
    (and
      (visited reykjavik day1)
      (visited reykjavik day2)

      (visited vienna day3)
      (visited vienna day4)
      (visited vienna day5)
      (visited vienna day6)
      (visited vienna day7)

      (visited venice day8)
      (visited venice day9)
      (visited venice day10)
      (visited venice day11)

      (wedding_attended)
    )
  )
)