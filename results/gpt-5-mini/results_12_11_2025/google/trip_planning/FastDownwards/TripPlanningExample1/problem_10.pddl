(define (problem trip1)
  (:domain trip-planning)
  (:objects
    riga manchester split - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 - day
  )

  (:init
    ;; Start location and day pointer (start city is Riga)
    (at_city riga)
    (at_day d1)

    ;; Day 1 already occupied and assigned by starting in Riga; Riga marked visited.
    (occ riga d1)
    (assigned d1)
    (visited riga)

    ;; Contiguous day ordering for the 15-day horizon
    (succ d1 d2) (succ d2 d3) (succ d3 d4) (succ d4 d5)
    (succ d5 d6) (succ d6 d7) (succ d7 d8) (succ d8 d9)
    (succ d9 d10) (succ d10 d11) (succ d11 d12) (succ d12 d13)
    (succ d13 d14) (succ d14 d15)

    ;; Direct flights as provided
    (direct riga manchester)
    (direct manchester riga)
    (direct manchester split)
  )

  (:goal
    (and
      ;; Enforce exact per-city day occupancy as audited:
      ;; Riga: days d1..d5  (5 days)
      (occ riga d1) (occ riga d2) (occ riga d3) (occ riga d4) (occ riga d5)
      ;; Manchester: days d6..d9 (4 days)
      (occ manchester d6) (occ manchester d7) (occ manchester d8) (occ manchester d9)
      ;; Split: days d10..d15 (6 days)
      (occ split d10) (occ split d11) (occ split d12) (occ split d13) (occ split d14) (occ split d15)

      ;; All days consumed
      (assigned d1) (assigned d2) (assigned d3) (assigned d4) (assigned d5)
      (assigned d6) (assigned d7) (assigned d8) (assigned d9)
      (assigned d10) (assigned d11) (assigned d12) (assigned d13) (assigned d14) (assigned d15)

      ;; All three cities visited (single-pass enforced by action preconditions)
      (visited riga) (visited manchester) (visited split)
    )
  )
)