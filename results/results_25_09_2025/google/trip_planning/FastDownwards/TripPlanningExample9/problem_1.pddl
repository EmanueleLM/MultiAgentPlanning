(define (problem trip-10days)
  (:domain travel-multiagent)
  (:objects
    frankfurt bucharest stuttgart - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 - day
  )
  (:init
    (at-traveler bucharest)
    (next day1 day2) (next day2 day3) (next day3 day4) (next day4 day5)
    (next day5 day6) (next day6 day7) (next day7 day8) (next day8 day9)
    (next day9 day10) (next day10 day11)
    (current-day day1)
    (in-window day5) (in-window day6) (in-window day7) (in-window day8) (in-window day9) (in-window day10)
    (direct bucharest frankfurt) (direct frankfurt bucharest)
    (direct frankfurt stuttgart) (direct stuttgart frankfurt)
    (= (spent-frankfurt) 0)
    (= (spent-bucharest) 0)
    (= (spent-stuttgart) 0)
    (= (day-count) 0)
  )
  (:goal (and
    (= (spent-frankfurt) 3)
    (= (spent-bucharest) 3)
    (= (day-count) 10)
    (workshop-attended)
  ))
)