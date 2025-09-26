(define (problem travel-11-days)
  (:domain travel-days-classical)
  (:objects
    traveler - agent
    venice dubrovnik istanbul - city
    day0 day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 - day
  )
  (:init
    (at traveler dubrovnik)
    (visited dubrovnik)
    (current day0)

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
    (next day10 day11)

    (direct-flight dubrovnik venice)
    (direct-flight dubrovnik istanbul)
  )
  (:goal
    (and
      (current day11)
      (visited venice)
      (visited dubrovnik)
      (visited istanbul)
    )
  )
  (:metric minimize (total-cost))
)