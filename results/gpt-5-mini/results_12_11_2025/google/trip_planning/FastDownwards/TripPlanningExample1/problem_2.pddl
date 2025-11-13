(define (problem trip1)
  (:domain trip-planning)
  (:objects
    riga manchester split - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 - day
  )

  (:init
    ;; Start: at Riga on day 1
    (at riga d1)
    (assigned d1)

    ;; Day succession relation
    (succ d1 d2) (succ d2 d3) (succ d3 d4) (succ d4 d5)
    (succ d5 d6) (succ d6 d7) (succ d7 d8) (succ d8 d9)
    (succ d9 d10) (succ d10 d11) (succ d11 d12) (succ d12 d13)
    (succ d13 d14) (succ d14 d15)

    ;; Direct flights (as provided)
    (direct riga manchester)
    (direct manchester riga)
    (direct manchester split)
  )

  ;; Goal: contiguous blocks with exact per-city day counts:
  ;; Riga days: d1..d5 (5 days)
  ;; Manchester days: d6..d9 (4 days)
  ;; Split days: d10..d15 (6 days)
  (:goal
    (and
      (at riga d1) (at riga d2) (at riga d3) (at riga d4) (at riga d5)
      (at manchester d6) (at manchester d7) (at manchester d8) (at manchester d9)
      (at split d10) (at split d11) (at split d12) (at split d13) (at split d14) (at split d15)
    )
  )
)