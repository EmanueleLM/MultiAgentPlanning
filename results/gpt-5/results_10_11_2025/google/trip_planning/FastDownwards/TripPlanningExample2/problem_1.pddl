(define (problem tripplanningexample2)
  (:domain trip-planning)

  (:objects
    Reykjavik Vienna Venice - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 - day
    rek-token1 rek-token2 - token
    vie-token1 vie-token2 vie-token3 vie-token4 vie-token5 - token
    ven-token1 ven-token2 ven-token3 ven-token4 - token
  )

  (:init
    ; Day adjacency
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

    ; Direct flight connectivity (bidirectional)
    (connected Reykjavik Vienna)
    (connected Vienna Reykjavik)
    (connected Vienna Venice)
    (connected Venice Vienna)

    ; Wedding window days
    (window day8)
    (window day9)
    (window day10)
    (window day11)

    ; Mark Venice
    (city-venice Venice)

    ; Token to city mapping
    (token-city rek-token1 Reykjavik)
    (token-city rek-token2 Reykjavik)
    (token-city vie-token1 Vienna)
    (token-city vie-token2 Vienna)
    (token-city vie-token3 Vienna)
    (token-city vie-token4 Vienna)
    (token-city vie-token5 Vienna)
    (token-city ven-token1 Venice)
    (token-city ven-token2 Venice)
    (token-city ven-token3 Venice)
    (token-city ven-token4 Venice)

    ; Initial availability/usage reflecting per-city day counts (2 REK, 5 VIE, 4 VEN)
    (used rek-token1)            ; consumed by day 1 assignment (see below)
    (available rek-token2)

    (available vie-token1)
    (available vie-token2)
    (available vie-token3)
    (available vie-token4)
    (available vie-token5)

    (available ven-token1)
    (available ven-token2)
    (available ven-token3)
    (available ven-token4)

    ; Day 1 is set per audited plan
    (at day1 Reykjavik)
    (filled day1)
    ; wedding-ok not initially true (must be achieved by assigning Venice on a window day)
  )

  (:goal (and
    ; All remaining days must be assigned (day1 already assigned)
    (filled day2)
    (filled day3)
    (filled day4)
    (filled day5)
    (filled day6)
    (filled day7)
    (filled day8)
    (filled day9)
    (filled day10)
    (filled day11)

    ; Exact city-day totals via token usage
    (used rek-token1)
    (used rek-token2)
    (used vie-token1)
    (used vie-token2)
    (used vie-token3)
    (used vie-token4)
    (used vie-token5)
    (used ven-token1)
    (used ven-token2)
    (used ven-token3)
    (used ven-token4)

    ; Wedding requirement: at least one Venice assignment within days 8..11
    (wedding-ok)
  ))
)