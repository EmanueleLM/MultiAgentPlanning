(define (problem trip-planning-problem)
  (:domain trip-planning)
  (:objects
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 - day
    amsterdam istanbul santorini - city
  )

  (:init
    ;; day sequencing (explicit successor relation)
    (next day1 day2) (next day2 day3) (next day3 day4) (next day4 day5)
    (next day5 day6) (next day6 day7) (next day7 day8) (next day8 day9)
    (next day9 day10) (next day10 day11) (next day11 day12) (next day12 day13)
    (next day13 day14)

    ;; direct flight network (directed edges only as provided)
    (direct amsterdam santorini)
    (direct santorini amsterdam)
    (direct amsterdam istanbul)
    (direct istanbul amsterdam)

    ;; starting location (initially assigned day1 = Amsterdam)
    (at day1 amsterdam)
    (assigned day1)
  )

  ;; Goal: fully specified feasible itinerary (14 days),
  ;; respecting hard constraints: Santorini on days 12-14 (contiguous),
  ;; Amsterdam exactly on seven specified days (days 1-6 and 11).
  (:goal
    (and
      ;; explicit city for every day (enforces exact assignment)
      (at day1 amsterdam)
      (at day2 amsterdam)
      (at day3 amsterdam)
      (at day4 amsterdam)
      (at day5 amsterdam)
      (at day6 amsterdam)
      (at day7 istanbul)
      (at day8 istanbul)
      (at day9 istanbul)
      (at day10 istanbul)
      (at day11 amsterdam)
      (at day12 santorini)
      (at day13 santorini)
      (at day14 santorini)

      ;; ensure every day is marked assigned (structural completion)
      (assigned day1) (assigned day2) (assigned day3) (assigned day4)
      (assigned day5) (assigned day6) (assigned day7) (assigned day8)
      (assigned day9) (assigned day10) (assigned day11) (assigned day12)
      (assigned day13) (assigned day14)
    )
  )
)