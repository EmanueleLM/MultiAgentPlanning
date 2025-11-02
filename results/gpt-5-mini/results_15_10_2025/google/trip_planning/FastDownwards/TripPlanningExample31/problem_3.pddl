(define (problem trip-visit-eu)
  (:domain trip-planning)
  (:objects
    frankfurt reykjavik split - city
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

    (connected frankfurt reykjavik)
    (connected reykjavik frankfurt)
    (connected frankfurt split)
    (connected split frankfurt)

    (at day1 split)

    (free day2)
    (free day3)
    (free day4)
    (free day5)
    (free day6)
    (free day7)
    (free day8)
    (free day9)
    (free day10)
  )

  (:goal
    (and
      (at day1 split)
      (at day2 split)
      (at day3 split)
      (at day4 split)
      (at day5 split)

      (at day6 frankfurt)
      (at day7 frankfurt)

      (at day8 reykjavik)
      (at day9 reykjavik)
      (at day10 reykjavik)
    )
  )

  (:metric minimize (total-cost))
)