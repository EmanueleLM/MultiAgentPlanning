(define (problem trip-berlin-frankfurt-bucharest)
  (:domain trip-planning)

  (:objects
    traveler - person
    berlin frankfurt bucharest - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 - day
  )

  (:init
    (at traveler berlin day1)

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

    (connected berlin frankfurt)
    (connected frankfurt berlin)
    (connected frankfurt bucharest)
    (connected bucharest frankfurt)
  )

  (:goal
    (and
      ;; Berlin event: presence required days 1..7
      (at traveler berlin day1)
      (at traveler berlin day2)
      (at traveler berlin day3)
      (at traveler berlin day4)
      (at traveler berlin day5)
      (at traveler berlin day6)
      (at traveler berlin day7)

      ;; Frankfurt requested 4 days (as a hard constraint reported by the Frankfurt planner)
      (at traveler frankfurt day8)
      (at traveler frankfurt day9)
      (at traveler frankfurt day10)
      (at traveler frankfurt day11)

      ;; Bucharest requested 2 days (as reported by the Frankfurt planner)
      (at traveler bucharest day9)
      (at traveler bucharest day10)
    )
  )
)