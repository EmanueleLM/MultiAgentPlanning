(define (problem trip_planning_example_26_problem)
  (:domain trip_planning_example_26)
  (:objects
    porto berlin reykjavik - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 day15 day16 - day
  )

  (:init
    ;; Starting location and day
    (at porto day1)
    (visited porto day1)

    ;; Day sequence
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
    (next day11 day12)
    (next day12 day13)
    (next day13 day14)
    (next day14 day15)
    (next day15 day16)

    ;; Direct flight connections
    (connected porto berlin)
    (connected berlin porto)
    (connected berlin reykjavik)
    (connected reykjavik berlin)

    ;; Friend's presence in Reykjavik
    (friend_at reykjavik day12)
    (friend_at reykjavik day13)
    (friend_at reykjavik day14)
    (friend_at reykjavik day15)
    (friend_at reykjavik day16)
  )

  (:goal
    (and
      ;; Stay 7 days in Porto (Days 1 to 7)
      (visited porto day1)
      (visited porto day2)
      (visited porto day3)
      (visited porto day4)
      (visited porto day5)
      (visited porto day6)
      (visited porto day7)

      ;; Spend 6 days in Berlin (Days 7 to 12)
      (visited berlin day7)
      (visited berlin day8)
      (visited berlin day9)
      (visited berlin day10)
      (visited berlin day11)
      (visited berlin day12)

      ;; Visit Reykjavik for 5 days (Days 12 to 16)
      (visited reykjavik day12)
      (visited reykjavik day13)
      (visited reykjavik day14)
      (visited reykjavik day15)
      (visited reykjavik day16)

      ;; Meet friend in Reykjavik
      (met_friend)

      ;; End the trip in Reykjavik on Day 16
      (at reykjavik day16)
    )
  )
)