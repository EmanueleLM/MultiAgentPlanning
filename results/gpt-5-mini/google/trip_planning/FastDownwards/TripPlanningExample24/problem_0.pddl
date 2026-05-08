(define (problem itinerary-problem)
  (:domain itinerary-domain)

  (:objects
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 day11 day12 day13 - day
    florence amsterdam riga - city
  )

  (:init
    ;; Successor (contiguity) relations for days 1..13
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

    ;; No days are pre-assigned and no workshop is held in the initial state.
    ;; (Assigned and workshop-held are absent initially; actions use negative preconditions to test for them.)
  )

  ;; Goal: the locked itinerary Option A (Florence days 1-4, Amsterdam 5-10, Riga 11-13)
  ;; and a workshop scheduled on some day in Florence between day1 and day4 inclusive.
  (:goal
    (and
      ;; Florence days 1-4 (exactly these days must be Florence by goal facts)
      (in-day day1 florence)
      (in-day day2 florence)
      (in-day day3 florence)
      (in-day day4 florence)

      ;; Amsterdam days 5-10
      (in-day day5 amsterdam)
      (in-day day6 amsterdam)
      (in-day day7 amsterdam)
      (in-day day8 amsterdam)
      (in-day day9 amsterdam)
      (in-day day10 amsterdam)

      ;; Riga days 11-13
      (in-day day11 riga)
      (in-day day12 riga)
      (in-day day13 riga)

      ;; Workshop must be held (the workshop action can only make this true on day1..day4 in Florence)
      (workshop-held)
    )
  )
)