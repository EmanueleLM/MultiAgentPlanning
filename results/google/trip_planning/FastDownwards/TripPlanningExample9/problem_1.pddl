(define (problem integrated-trip-problem)
  (:domain integrated-trip)
  (:objects
    frankfurt bucharest stuttgart - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 - day
  )

  (:init
    ;; direct flights (bidirectional only where known)
    (direct bucharest frankfurt)
    (direct frankfurt bucharest)
    (direct frankfurt stuttgart)
    (direct stuttgart frankfurt)

    ;; day succession
    (next d1 d2) (next d2 d3) (next d3 d4) (next d4 d5)
    (next d5 d6) (next d6 d7) (next d7 d8) (next d8 d9) (next d9 d10)

    ;; initial counters
    (frank-count-0)
    (buch-count-0)

    ;; total cost starts at 0
    (= (total-cost) 0)
  )

  (:goal (and
    ;; every day must be assigned to ensure full 10-day schedule
    (assigned d1) (assigned d2) (assigned d3) (assigned d4) (assigned d5)
    (assigned d6) (assigned d7) (assigned d8) (assigned d9) (assigned d10)

    ;; must spend at least 3 days in Frankfurt (symbolic counter >=3)
    (or (frank-count-3) (frank-count-4) (frank-count-5) (frank-count-6) (frank-count-7) (frank-count-8) (frank-count-9) (frank-count-10))

    ;; must spend at least 3 days in Bucharest (symbolic counter >=3)
    (or (buch-count-3) (buch-count-4) (buch-count-5) (buch-count-6) (buch-count-7) (buch-count-8) (buch-count-9) (buch-count-10))

    ;; attend workshop in Stuttgart between day 5 and day 10 (inclusive)
    (or (at stuttgart d5) (at stuttgart d6) (at stuttgart d7) (at stuttgart d8) (at stuttgart d9) (at stuttgart d10))
  ))

  (:metric minimize (total-cost))
)