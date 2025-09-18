(define (problem trip-problem-combined)
  (:domain combined-trip-domain)

  (:objects
    florence barcelona helsinki - city

    day0 day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 day14 - day

    sf0 sf1 sf2 sf3 sf4 sf5 sf6 - sf
    sb0 sb1 sb2 sb3 sb4 - sb
    sh0 sh1 - sh
  )

  (:init
    ;; initial symbolic day
    (day day0)

    ;; next-day relations
    (next-day day0 day1) (next-day day1 day2) (next-day day2 day3) (next-day day3 day4)
    (next-day day4 day5) (next-day day5 day6) (next-day day6 day7) (next-day day7 day8)
    (next-day day8 day9) (next-day day9 day10) (next-day day10 day11) (next-day day11 day12)
    (next-day day12 day13) (next-day day13 day14)

    ;; per-city spent counters start at zero
    (spent-florence sf0)
    (spent-barcelona sb0)
    (spent-helsinki sh0)

    ;; next relations for spent counters (increment semantics)
    (next-sf sf0 sf1) (next-sf sf1 sf2) (next-sf sf2 sf3) (next-sf sf3 sf4)
    (next-sf sf4 sf5) (next-sf sf5 sf6)

    (next-sb sb0 sb1) (next-sb sb1 sb2) (next-sb sb2 sb3) (next-sb sb3 sb4)

    (next-sh sh0 sh1)

    ;; start location and bookkeeping
    (at barcelona)
    (visited barcelona)

    ;; known direct connections (public info)
    (link barcelona florence)
    (link florence barcelona)
    (link barcelona helsinki)
    (link helsinki barcelona)

    ;; window predicate for meeting in Florence: days 9..14
    (window9to14 day9) (window9to14 day10) (window9to14 day11) (window9to14 day12)
    (window9to14 day13) (window9to14 day14)
  )

  (:goal
    (and
      ;; final day must be day14
      (day day14)

      ;; required per-city spent allocations
      (spent-florence sf6)
      (spent-barcelona sb4)
      (spent-helsinki sh1)

      ;; meeting must have occurred
      (met)
    )
  )
)