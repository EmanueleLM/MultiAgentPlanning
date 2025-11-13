(define (problem travel-11days)
  (:domain travel-domain)
  (:objects
    ; cities
    Amsterdam Vilnius Bucharest - city

    ; days
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 - day
  )

  (:init
    ; successor chain for days 1..11
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

    ; direct-flight connectivity (undirected edges expressed both directions)
    (connected Amsterdam Bucharest)
    (connected Bucharest Amsterdam)

    (connected Vilnius Amsterdam)
    (connected Amsterdam Vilnius)

    ; Allowed city assignments per day encode the auditor's resolved exact stays:
    ; Vilnius = 2 days (day1, day2)
    ; Amsterdam = 3 days (day3, day4, day5)
    ; Bucharest = 6 days (day6..day11)
    ; Restricting allowed city per day enforces the exact counts as hard structural constraints.
    (allowed Vilnius day1)
    (allowed Vilnius day2)

    (allowed Amsterdam day3)
    (allowed Amsterdam day4)
    (allowed Amsterdam day5)

    (allowed Bucharest day6)
    (allowed Bucharest day7)
    (allowed Bucharest day8)
    (allowed Bucharest day9)
    (allowed Bucharest day10)
    (allowed Bucharest day11)
    ; No other (allowed ...) facts are present, so no other city assignments are possible for each day.

    ; Initially no day is assigned (assigned facts absent)
  )

  ;; Goal: every day must be assigned a city.
  ;; Because the initial 'allowed' facts permit exactly 2 Vilnius, 3 Amsterdam, and 6 Bucharest day-assignments,
  ;; any plan that achieves this goal will necessarily realize the auditor's resolved stay counts
  ;; and (because days 6..11 are allowed only Bucharest) will meet the Bucharest friend-window requirement.
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