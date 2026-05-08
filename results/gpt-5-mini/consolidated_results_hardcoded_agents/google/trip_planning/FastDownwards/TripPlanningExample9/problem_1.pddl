(define (problem trip-planning-problem)
  (:domain trip-planning)
  (:objects
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 - day
    bucharest frankfurt stuttgart - city
  )
  (:init
    (next day1 day2) (next day2 day3) (next day3 day4) (next day4 day5) (next day5 day6)
    (next day6 day7) (next day7 day8) (next day8 day9) (next day9 day10)
    (flight bucharest frankfurt) (flight frankfurt bucharest)
    (flight frankfurt stuttgart) (flight stuttgart frankfurt)
    (at day1 frankfurt)
    (free day2) (free day3) (free day4) (free day5) (free day6) (free day7) (free day8) (free day9) (free day10)
  )
  (:goal (and
    (at day1 frankfurt) (at day2 frankfurt) (at day3 frankfurt)
    (at day4 bucharest) (at day5 bucharest) (at day6 bucharest)
    (at day7 frankfurt)
    (at day8 stuttgart) (at day9 stuttgart) (at day10 stuttgart)
  ))
)