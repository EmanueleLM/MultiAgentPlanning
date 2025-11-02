(define (problem trip-instance-13)
  (:domain trip-planning-13)

  ; Target counts chosen to satisfy hard constraints and align with preferences:
  ; Florence = 4 (exact, days 1..4 due to workshop)
  ; Amsterdam = 6 (maximize Amsterdam within remaining days)
  ; Riga = 3
  ; Totals: 4 + 6 + 3 = 13

  (:objects
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 - day
    f1 f2 f3 f4 - ftoken
    a1 a2 a3 a4 a5 a6 - atoken
    r1 r2 r3 - rtoken
  )

  (:init
    ; Day chain
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

    ; First and last day markers
    (at-first day1)
    (last-day day13)

    ; Workshop window: days 1..4 must be in Florence.
    ; Enforced by: first-day action + no flights into workshop days.
    (workshop-day day2)
    (workshop-day day3)
    (workshop-day day4)

    ; Flight graph (directed edges only)
    (direct florence amsterdam)
    (direct amsterdam florence)
    (direct amsterdam riga)
    (direct riga amsterdam)

    ; City-day quota tokens available at start
    (avail-f f1) (avail-f f2) (avail-f f3) (avail-f f4)
    (avail-a a1) (avail-a a2) (avail-a a3) (avail-a a4) (avail-a a5) (avail-a a6)
    (avail-r r1) (avail-r r2) (avail-r r3)
  )

  (:goal (and
    ; All 13 days assigned
    (decided day1)
    (decided day2)
    (decided day3)
    (decided day4)
    (decided day5)
    (decided day6)
    (decided day7)
    (decided day8)
    (decided day9)
    (decided day10)
    (decided day11)
    (decided day12)
    (decided day13)

    ; Visit all three cities at least once
    (visited florence)
    (visited amsterdam)
    (visited riga)

    ; Exact city-day counts via token usage:
    ; Florence exactly 4, Amsterdam exactly 6, Riga exactly 3
    (used-f f1) (used-f f2) (used-f f3) (used-f f4)
    (used-a a1) (used-a a2) (used-a a3) (used-a a4) (used-a a5) (used-a a6)
    (used-r r1) (used-r r2) (used-r r3)
  ))
)