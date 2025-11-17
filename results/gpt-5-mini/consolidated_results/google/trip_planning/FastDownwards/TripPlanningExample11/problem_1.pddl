(define (problem trip-problem)
  (:domain trip)

  (:objects
    you - person
    vienna vilnius valencia - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 day15 - day
  )

  (:init
    (current-day day1)
    (at you vienna day1)

    ;; direct flight connections
    (direct vienna valencia)
    (direct valencia vienna)
    (direct vilnius vienna)
    (direct vienna vilnius)

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
    (next day11 day12)
    (next day12 day13)
    (next day13 day14)
    (next day14 day15)
  )

  (:goal
    (and
      ;; Vienna 5 days (days 1-5)
      (at you vienna day1)
      (at you vienna day2)
      (at you vienna day3)
      (at you vienna day4)
      (at you vienna day5)

      ;; Vilnius 5 days (days 6-10)
      (at you vilnius day6)
      (at you vilnius day7)
      (at you vilnius day8)
      (at you vilnius day9)
      (at you vilnius day10)

      ;; Valencia 7 days (days 9-15), must include conferences on day9 and day15
      (at you valencia day9)
      (at you valencia day10)
      (at you valencia day11)
      (at you valencia day12)
      (at you valencia day13)
      (at you valencia day14)
      (at you valencia day15)

      ;; conference attendance explicit (redundant with above)
      (at you valencia day9)
      (at you valencia day15)
    )
  )
)