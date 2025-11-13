(define (problem tripplanningexample9)
  (:domain trip-planning)
  (:objects
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 - day
    bucharest frankfurt stuttgart - city
  )

  (:init
    ;; day succession chain
    (next day1 day2) (next day2 day3) (next day3 day4) (next day4 day5)
    (next day5 day6) (next day6 day7) (next day7 day8) (next day8 day9)
    (next day9 day10)

    ;; start and end markers
    (start-day day1)
    (last-day day10)

    ;; begin assignment pointer at day1
    (next-to-assign day1)

    ;; direct flights (bidirectional)
    (flight bucharest frankfurt)
    (flight frankfurt bucharest)
    (flight frankfurt stuttgart)
    (flight stuttgart frankfurt)
  )

  ;; Canonical feasible plan: days 1-3 Bucharest, 4-6 Frankfurt, 7-10 Stuttgart.
  (:goal (and
    (at day1 bucharest) (at day2 bucharest) (at day3 bucharest)
    (at day4 frankfurt) (at day5 frankfurt) (at day6 frankfurt)
    (at day7 stuttgart) (at day8 stuttgart) (at day9 stuttgart) (at day10 stuttgart)
  ))
)