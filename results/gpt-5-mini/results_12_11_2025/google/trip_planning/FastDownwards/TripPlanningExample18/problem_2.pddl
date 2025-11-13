(define (problem travel-11days)
  (:domain travel-domain)
  (:objects
    Amsterdam Vilnius Bucharest - city

    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 - day
  )

  (:init
    ;; successor chain for days 1..11
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

    ;; direct-flight connectivity (undirected edges expressed both directions)
    (connected Amsterdam Bucharest)
    (connected Bucharest Amsterdam)

    (connected Vilnius Amsterdam)
    (connected Amsterdam Vilnius)

    ;; Mark the designated start day (only day1)
    (start-day day1)

    ;; Allowed city assignments per day encode the auditor's resolved exact stays and enforce contiguous occupancy:
    ;; Vilnius = 2 days (day1, day2)
    (allowed Vilnius day1)
    (allowed Vilnius day2)

    ;; Amsterdam = 3 days (day3, day4, day5)
    (allowed Amsterdam day3)
    (allowed Amsterdam day4)
    (allowed Amsterdam day5)

    ;; Bucharest = 6 days (day6..day11) — also ensures meeting friends within days 6-11
    (allowed Bucharest day6)
    (allowed Bucharest day7)
    (allowed Bucharest day8)
    (allowed Bucharest day9)
    (allowed Bucharest day10)
    (allowed Bucharest day11)

    ;; No (assigned ...) facts initially; days become assigned only via start/stay/fly actions.
  )

  ;; Goal: every day must be assigned a city (this, together with the allowed facts, enforces the exact stay counts
  ;; and the Bucharest meeting window structurally, with contiguous occupancy enforced by allowed day ranges).
  (:goal (and
    (assigned day1)
    (assigned day2)
    (assigned day3)
    (assigned day4)
    (assigned day5)
    (assigned day6)
    (assigned day7)
    (assigned day8)
    (assigned day9)
    (assigned day10)
    (assigned day11)
  ))
)