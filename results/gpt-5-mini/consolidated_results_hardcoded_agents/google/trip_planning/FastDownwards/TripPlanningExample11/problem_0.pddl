(define (problem trip-problem)
  (:domain trip)

  (:objects
    you - person
    vienna vilnius valencia - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 day15 - day
  )

  ;; Initial state: start at Vienna on day1, current day is day1.
  (:init
    (current-day day1)
    (at you vienna day1)
  )

  ;; Goals (hard constraints encoded exactly as requested):
  ;; - Vienna planned stay 5 days: earliest feasible allocation -> days 1..5
  ;; - Vilnius planned stay 5 days: earliest feasible allocation after Vienna -> days 6..10
  ;; - Valencia planned stay 7 days: must include conference days 9 and 15. Earliest 7-day block that includes day9 and day15 is days 9..15.
  ;; Note: These goals produce an oversubscription (days 9..10 appear in both Vilnius and Valencia).
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

      ;; Valencia 7 days (days 9-15) — must include conferences on day9 and day15
      (at you valencia day9)
      (at you valencia day10)
      (at you valencia day11)
      (at you valencia day12)
      (at you valencia day13)
      (at you valencia day14)
      (at you valencia day15)

      ;; Explicit conference attendance goals (redundant with above but kept explicit)
      (at you valencia day9)
      (at you valencia day15)
    )
  )
)