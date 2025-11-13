(define (problem tripplanningexample9)
  (:domain trip-planning)
  (:objects
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 - day
    bucharest frankfurt stuttgart - city
  )

  (:init
    ;; consecutive day chain including a sentinel day11 for pointer progression
    (next day1 day2) (next day2 day3) (next day3 day4) (next day4 day5)
    (next day5 day6) (next day6 day7) (next day7 day8) (next day8 day9)
    (next day9 day10) (next day10 day11)

    ;; start assigning from day1
    (next-to-assign day1)
    (first-day day1)

    ;; flights (bidirectional edges explicit)
    (flight bucharest frankfurt)
    (flight frankfurt bucharest)
    (flight frankfurt stuttgart)
    (flight stuttgart frankfurt)
  )

  ;; Goal enforces exact occupancy counts and ensures at least one stuttgart day in the workshop window (days 5..10)
  ;; The goal below is the canonical feasible sequence: days 1-3 bucharest, 4-6 frankfurt, 7-10 stuttgart.
  (:goal (and
    (at day1 bucharest) (at day2 bucharest) (at day3 bucharest)
    (at day4 frankfurt) (at day5 frankfurt) (at day6 frankfurt)
    (at day7 stuttgart) (at day8 stuttgart) (at day9 stuttgart) (at day10 stuttgart)
  ))
)