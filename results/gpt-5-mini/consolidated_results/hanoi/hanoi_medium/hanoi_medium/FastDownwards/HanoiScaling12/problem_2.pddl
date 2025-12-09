(define (problem hanoi-five)
  (:domain hanoi)
  (:objects
    a b c d e - disk
    left middle right - peg
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 s17 s18 s19 s20 s21 s22 s23 s24 s25 s26 s27 s28 s29 s30 s31 - step
  )

  (:init
    ;; Initial tower on the right peg: bottom e, then d, c, b, a (a is top)
    (on-peg e right)
    (on-disk d e)
    (on-disk c d)
    (on-disk b c)
    (on-disk a b)

    ;; Only the top disk a is clear; left and middle pegs empty
    (clear-disk a)
    (clear-peg left)
    (clear-peg middle)

    ;; Size ordering: a < b < c < d < e
    (smaller a b) (smaller a c) (smaller a d) (smaller a e)
    (smaller b c) (smaller b d) (smaller b e)
    (smaller c d) (smaller c e)
    (smaller d e)

    ;; Stage chain s0 -> s1 -> ... -> s31 (enforces exactly 31 moves)
    (next s0 s1) (next s1 s2) (next s2 s3) (next s3 s4) (next s4 s5)
    (next s5 s6) (next s6 s7) (next s7 s8) (next s8 s9) (next s9 s10)
    (next s10 s11) (next s11 s12) (next s12 s13) (next s13 s14) (next s14 s15)
    (next s15 s16) (next s16 s17) (next s17 s18) (next s18 s19) (next s19 s20)
    (next s20 s21) (next s21 s22) (next s22 s23) (next s23 s24) (next s24 s25)
    (next s25 s26) (next s26 s27) (next s27 s28) (next s28 s29) (next s29 s30)
    (next s30 s31)

    ;; Start at stage s0
    (time-now s0)
  )

  (:goal
    (and
      ;; Desired final tower on the left peg: bottom e, then d, c, b, a (a top)
      (on-peg e left)
      (on-disk d e)
      (on-disk c d)
      (on-disk b c)
      (on-disk a b)

      ;; Middle and right pegs empty at the end
      (clear-peg middle)
      (clear-peg right)

      ;; Terminal stage reached (enforces exactly 31 moves)
      (time-now s31)
    )
  )
)