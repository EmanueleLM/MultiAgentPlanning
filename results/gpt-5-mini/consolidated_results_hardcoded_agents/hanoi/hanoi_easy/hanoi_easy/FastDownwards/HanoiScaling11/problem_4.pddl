(define (problem hanoi-4)
  (:domain hanoi)
  (:objects
    left middle right - peg
    A B C D - disk
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 - stage
  )

  (:init
    ;; size ordering (smaller x y means x is smaller than y)
    (smaller A B) (smaller A C) (smaller A D)
    (smaller B C) (smaller B D)
    (smaller C D)

    ;; initial stacking on middle peg: top-to-bottom A B C D
    (on-disk A B)
    (on-disk B C)
    (on-disk C D)
    (on-peg D middle)

    ;; top disk on middle is A
    (top A middle)

    ;; other pegs start empty
    (empty left)
    (empty right)

    ;; stage succession (16 stages total: s0 .. s15) to force exactly 15 moves
    (succ s0 s1) (succ s1 s2) (succ s2 s3) (succ s3 s4)
    (succ s4 s5) (succ s5 s6) (succ s6 s7) (succ s7 s8)
    (succ s8 s9) (succ s9 s10) (succ s10 s11) (succ s11 s12)
    (succ s12 s13) (succ s13 s14) (succ s14 s15)

    ;; start at stage s0
    (current s0)
  )

  (:goal (and
    ;; final stacking on right peg: top-to-bottom A B C D
    (on-disk A B)
    (on-disk B C)
    (on-disk C D)
    (on-peg D right)
    (top A right)

    ;; left and middle pegs empty
    (empty left)
    (empty middle)

    ;; final stage reached
    (current s15)
  ))