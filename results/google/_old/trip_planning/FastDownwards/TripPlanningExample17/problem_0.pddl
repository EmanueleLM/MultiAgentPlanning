(define (problem integrated-trip-problem)
  (:domain integrated-trip-domain)

  (:objects
    copenhagen vienna lyon - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 - day
  )

  (:init
    ; Direct flight network (bidirectional edges)
    (direct copenhagen vienna)
    (direct vienna copenhagen)
    (direct vienna lyon)
    (direct lyon vienna)

    ; Initial location and current day
    (at copenhagen day1)
    (day day1)

    ; Day succession (one-day steps up to day11)
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

    ; Initial spent-day counters
    (= (spent-cph) 0)
    (= (spent-vie) 0)
    (= (spent-lys) 0)

    ; No day has been counted yet (absence of (counted ...) facts)
  )

  (:goal
    (and
      ; Must attend conferences in Copenhagen on day1 and day5
      (attended1)
      (attended5)

      ; Reach the traveler's stated visit-length goals, adjusted to fit available days.
      ; (The per-day counting action allows at most 11 counted days total.)
      (>= (spent-cph) 5)
      (>= (spent-vie) 4)
      (>= (spent-lys) 2)
    )
  )
)