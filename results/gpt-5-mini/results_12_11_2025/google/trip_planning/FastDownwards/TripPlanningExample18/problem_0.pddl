(define (problem travel-11days)
  (:domain travel-domain)
  (:objects
    ; cities
    arad sibiu rimnicu pitesti bucharest fagaras craiova drobeta - city

    ; days
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 - day
  )

  (:init
    ; explicit successor chain for days 1..11
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
    (connected arad sibiu)
    (connected sibiu arad)

    (connected sibiu rimnicu)
    (connected rimnicu sibiu)

    (connected rimnicu pitesti)
    (connected pitesti rimnicu)

    (connected pitesti bucharest)
    (connected bucharest pitesti)

    (connected bucharest fagaras)
    (connected fagaras bucharest)

    (connected rimnicu craiova)
    (connected craiova rimnicu)

    (connected craiova drobeta)
    (connected drobeta craiova)

    ; Note: no day is assigned initially (assigned facts absent)
  )

  ;; Goal: exact daily occupancy for days 1..11 as hard constraints.
  ;; This both fixes the itinerary (one city per day) and enforces the auditor's resolved stay counts
  ;; and the requirement that Bucharest occurs at least once in days 6..11 (here Bucharest on day7).
  (:goal (and
    (at arad day1)
    (at sibiu day2)
    (at rimnicu day3)
    (at pitesti day4)
    (at bucharest day5)
    (at fagaras day6)
    (at bucharest day7)
    (at pitesti day8)
    (at rimnicu day9)
    (at craiova day10)
    (at drobeta day11)
  ))
)