(define (problem integrated-trip-problem)
  (:domain integrated-trip-domain)

  (:objects
    reykjavik vienna venice - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 - day
  )

  (:init
    ;; consecutive day relations
    (consecutive d1 d2)
    (consecutive d2 d3)
    (consecutive d3 d4)
    (consecutive d4 d5)
    (consecutive d5 d6)
    (consecutive d6 d7)
    (consecutive d7 d8)
    (consecutive d8 d9)
    (consecutive d9 d10)
    (consecutive d10 d11)

    ;; direct flights (only direct flights are allowed)
    (direct reykjavik vienna)
    (direct vienna reykjavik)
    (direct vienna venice)
    (direct venice vienna)

    ;; Mark the Reykjavik city (so Reykjavik assign/stay can detect it)
    (is-reykjavik reykjavik)

    ;; Wedding-window days (day 8..11 inclusive)
    (wedding-day d8)
    (wedding-day d9)
    (wedding-day d10)
    (wedding-day d11)

    ;; initial counters
    (= (reykjavik-days-left) 2)
    (= (v-days) 0)

    ;; initial agent-level location (allows original fly/stay actions if used)
    (at reykjavik)
  )

  ;; Goals:
  ;; - All 11 days must be assigned to some city
  ;; - The Reykjavik visit requirement must be satisfied (2 days there)
  ;; - At least 7 days in Vienna
  ;; - The wedding must be attended in Venice on a day between d8 and d11
  (:goal (and
           (assigned d1) (assigned d2) (assigned d3) (assigned d4) (assigned d5)
           (assigned d6) (assigned d7) (assigned d8) (assigned d9) (assigned d10) (assigned d11)
           (= (reykjavik-days-left) 0)
           (>= (v-days) 7)
           (wedding-attended)
         ))
)