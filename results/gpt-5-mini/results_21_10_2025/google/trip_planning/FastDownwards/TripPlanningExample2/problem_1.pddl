(define (problem trip-problem)
  (:domain trip-domain)
  (:objects
    traveler - agent
    Reykjavik Vienna Venice - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 - day
  )

  (:init
    ;; temporal chain for 11 days
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

    ;; allowed direct flights (only these)
    (direct Reykjavik Vienna)
    (direct Vienna Reykjavik)
    (direct Vienna Venice)
    (direct Venice Vienna)

    ;; initial location: traveler starts in Reykjavik on day1
    (at traveler Reykjavik day1)
  )

  (:goal
    (and
      ;; The goal requires confirming the required presence in each city on the specified days
      ;; Reykjavik: days 1..2
      (visited Reykjavik day1)
      (visited Reykjavik day2)

      ;; Vienna: days 3..7
      (visited Vienna day3)
      (visited Vienna day4)
      (visited Vienna day5)
      (visited Vienna day6)
      (visited Vienna day7)

      ;; Venice: days 8..11
      (visited Venice day8)
      (visited Venice day9)
      (visited Venice day10)
      (visited Venice day11)

      ;; wedding must be attended on at least one day between day8 and day11
      (wedding_attended)
    )
  )
)