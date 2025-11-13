(define (problem trip1)
  (:domain trip-planning)
  (:objects
    riga manchester split - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 - day
  )

  (:init
    ;; Start in Riga on day 1; day 1 is considered assigned and Riga is visited.
    (at riga d1)
    (assigned d1)
    (visited riga)

    ;; Successor (ordered) relation for contiguous days
    (succ d1 d2) (succ d2 d3) (succ d3 d4) (succ d4 d5)
    (succ d5 d6) (succ d6 d7) (succ d7 d8) (succ d8 d9)
    (succ d9 d10) (succ d10 d11) (succ d11 d12) (succ d12 d13)
    (succ d13 d14) (succ d14 d15)

    ;; Direct flight graph (as given)
    (direct riga manchester)
    (direct manchester riga)
    (direct manchester split)
  )

  (:goal
    (and
      ;; Enforce exact per-city contiguous day allocations by requiring 'at' for each day.
      ;; Riga: 5 days (d1..d5)
      (at riga d1) (at riga d2) (at riga d3) (at riga d4) (at riga d5)
      ;; Manchester: 4 days (d6..d9)
      (at manchester d6) (at manchester d7) (at manchester d8) (at manchester d9)
      ;; Split: 6 days (d10..d15)
      (at split d10) (at split d11) (at split d12) (at split d13) (at split d14) (at split d15)

      ;; All days must be assigned to enforce exact 15-day horizon.
      (assigned d1) (assigned d2) (assigned d3) (assigned d4) (assigned d5)
      (assigned d6) (assigned d7) (assigned d8) (assigned d9)
      (assigned d10) (assigned d11) (assigned d12) (assigned d13) (assigned d14) (assigned d15)

      ;; Each city must have been visited (ensures the plan visits all three cities).
      (visited riga) (visited manchester) (visited split)
    )
  )
)