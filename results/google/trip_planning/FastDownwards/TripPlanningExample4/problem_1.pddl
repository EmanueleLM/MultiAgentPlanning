(define (problem trip-planning-problem)
  (:domain trip-planning)
  (:objects
    seville munich tallinn - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 - day
  )
  (:init
    ;; timeline start
    (current-day day1)
    (not-started)

    ;; next-day relations up to day13 (day1 -> day2 ... day12 -> day13)
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

    ;; direct flight connectivity (only direct flights allowed)
    (connected seville munich)
    (connected munich seville)
    (connected munich tallinn)
    (connected tallinn munich)

    ;; initialize numeric counters
    (= (days-in seville) 0)
    (= (days-in munich) 0)
    (= (days-in tallinn) 0)
  )

  (:goal
    (and
      ;; plan covers exactly 12 day-advancements: require state after day12 (day13 is the "after last day")
      (current-day day13)

      ;; meeting constraint: presence in Tallinn on day11 or day12.
      ;; We enforce presence on both day11 and day12 to satisfy "2 days in Tallinn" and ensure meeting between day11 and day12.
      (visited tallinn day11)
      (visited tallinn day12)

      ;; ensure Tallinn is visited for at least 2 days (keeps the traveler's hard requirement)
      (>= (days-in tallinn) 2)
    )
  )
)