(define (problem travel_problem)
  (:domain travel_plan)

  (:objects
    paris reykjavik riga - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 - day
  )

  (:init
    (at paris day1)
    (can_fly paris reykjavik)
    (can_fly reykjavik paris)
    (can_fly riga paris)
    (can_fly paris riga)
    (show_at_reykjavik day6)
    (show_at_reykjavik day7)
    (show_at_reykjavik day8)
    (show_at_reykjavik day9)
    (show_at_reykjavik day10)
    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)
    (next day5 day6)
    (next day6 day7)
    (next day7 day8)
    (next day8 day9)
    (next day9 day10)
  )

  (:goal (and
    (visited reykjavik)
    (visited riga)
    (visited paris)
  ))
)