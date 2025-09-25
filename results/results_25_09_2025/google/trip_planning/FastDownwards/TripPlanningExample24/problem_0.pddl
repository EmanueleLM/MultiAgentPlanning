(define (problem itinerary-13-days)
  (:domain multi-agent-itinerary)
  (:objects
    florence amsterdam riga - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 - day
  )

  ;; Initial state: no days assigned, counts start at 0, flight connectivity, next-day relations,
  ;; and allowed workshop days (d1..d4).
  (:init
    ;; days-in counters start implicitly at 0 (no need to state zeros; but state them for clarity)
    (= (days-in florence) 0)
    (= (days-in amsterdam) 0)
    (= (days-in riga) 0)

    ;; Direct flights (symmetric facts are included explicitly)
    (direct-flight florence amsterdam)
    (direct-flight amsterdam florence)
    (direct-flight amsterdam riga)
    (direct-flight riga amsterdam)
    ;; Note: there is intentionally no direct-flight between florence and riga

    ;; Successor (next) relation between consecutive days
    (next d1 d2) (next d2 d3) (next d3 d4) (next d4 d5)
    (next d5 d6) (next d6 d7) (next d7 d8) (next d8 d9)
    (next d9 d10) (next d10 d11) (next d11 d12) (next d12 d13)

    ;; Workshop allowed days (days 1..4)
    (workshop-allowed d1)
    (workshop-allowed d2)
    (workshop-allowed d3)
    (workshop-allowed d4)
  )

  ;; Goal: assign all 13 days, meet per-city stay lengths exactly, and attend the workshop in Florence
  (:goal (and
    ;; every day must be assigned
    (assigned d1) (assigned d2) (assigned d3) (assigned d4) (assigned d5)
    (assigned d6) (assigned d7) (assigned d8) (assigned d9) (assigned d10)
    (assigned d11) (assigned d12) (assigned d13)

    ;; exact stays per city as required: Florence 4 days, Amsterdam 6 days, Riga 5 days
    (= (days-in florence) 4)
    (= (days-in amsterdam) 6)
    (= (days-in riga) 5)

    ;; workshop must be attended (its attendance action requires it occur on a workshop-allowed day in Florence)
    (workshop-attended)
  ))
)