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

    (at split day1)
  )

  (:goal
    (and
      (at split day1)
      (at split day2)
      (at split day3)
      (at split day4)
      (at split day5)

      (at frankfurt day6)
      (at frankfurt day7)

      (at reykjavik day8)
      (at reykjavik day9)
      (at reykjavik day10)
    )
  )

  (:metric minimize (total-cost))
)