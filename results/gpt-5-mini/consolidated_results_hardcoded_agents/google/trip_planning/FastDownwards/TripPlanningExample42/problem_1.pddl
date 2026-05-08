(define (problem trip11)
  (:domain multiagent-travel)
  (:objects
    paris nice mykonos - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 - day
  )
  (:init
    (at paris day1)
  )
  (:goal
    (and
      (at paris day1)
      (at paris day2)
      (at paris day3)
      (at paris day4)
      (at nice day5)
      (at nice day6)
      (at nice day7)
      (at mykonos day8)
      (at mykonos day9)
      (at mykonos day10)
      (at mykonos day11)
      (met-friends)
    )
  )
)