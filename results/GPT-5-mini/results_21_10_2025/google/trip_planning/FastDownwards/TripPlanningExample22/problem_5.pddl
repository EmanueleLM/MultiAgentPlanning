(define (problem trip-berlin-frankfurt-bucharest)
  (:domain trip-planning)

  (:objects
    traveler - person
    berlin frankfurt bucharest - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 - day
  )

  (:init
    ;; initial location: start in Berlin on day1 to satisfy the Berlin event
    (at traveler berlin day1)

    ;; day ordering
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

    ;; direct flight connections (bidirectional as available)
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

      ;; Bucharest desired 2 days (allocated to days 9..10 to allow travel via Frankfurt)
      (at traveler bucharest day9)
      (at traveler bucharest day10)

      ;; Frankfurt allocated 2 remaining days (days 8 and 11) to complete the 11-day trip
      (at traveler frankfurt day8)
      (at traveler frankfurt day11)
    )
  )
)