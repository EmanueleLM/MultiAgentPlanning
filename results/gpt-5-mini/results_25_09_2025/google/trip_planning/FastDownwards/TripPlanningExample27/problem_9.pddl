(define (problem trip_problem)
  (:domain trip_domain)
  (:objects
    istanbul amsterdam santorini - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 - day
  )

  (:init
    (at istanbul day1)

    (next day1 day2) (next day2 day3) (next day3 day4) (next day4 day5)
    (next day5 day6) (next day6 day7) (next day7 day8) (next day8 day9)
    (next day9 day10) (next day10 day11) (next day11 day12) (next day12 day13)
    (next day13 day14)

    (conn istanbul amsterdam)
    (conn amsterdam istanbul)
    (conn amsterdam santorini)
    (conn santorini amsterdam)

    (allowed-rel-day day12)
    (allowed-rel-day day13)
    (allowed-rel-day day14)
    (is-relatives-city santorini)
  )

  (:goal
    (and
      ;; Istanbul for 4 days (days 1-4)
      (at istanbul day1)
      (at istanbul day2)
      (at istanbul day3)
      (at istanbul day4)

      ;; Amsterdam for 7 days (days 5-11)
      (at amsterdam day5)
      (at amsterdam day6)
      (at amsterdam day7)
      (at amsterdam day8)
      (at amsterdam day9)
      (at amsterdam day10)
      (at amsterdam day11)

      ;; Santorini for 3 days (days 12-14)
      (at santorini day12)
      (at santorini day13)
      (at santorini day14)

      ;; relatives visit must be performed during the allowed window
      (visited-relatives)
    )
  )
)