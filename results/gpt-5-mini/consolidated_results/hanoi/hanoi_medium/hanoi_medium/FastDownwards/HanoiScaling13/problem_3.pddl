(define (problem hanoi5)
  (:domain hanoi)
  (:objects
    a b c d e - disk
    left middle right - peg
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 s17 s18 s19 s20 s21 s22 s23 s24 s25 s26 s27 s28 s29 s30 s31 - stage
  )

  (:init
    ;; initial stacking on the right peg: top-to-bottom a, b, c, d, e
    (on-disk a b)
    (on-disk b c)
    (on-disk c d)
    (on-disk d e)
    (on-peg e right)

    ;; top-most disk has nothing above it
    (clear-disk a)

    ;; empty pegs
    (clear-peg left)
    (clear-peg middle)

    ;; size ordering (smaller x y means x is smaller than y)
    (smaller a b) (smaller a c) (smaller a d) (smaller a e)
    (smaller b c) (smaller b d) (smaller b e)
    (smaller c d) (smaller c e)
    (smaller d e)

    ;; stage/time progression
    (curr s0)
    (next s0 s1) (next s1 s2) (next s2 s3) (next s3 s4) (next s4 s5)
    (next s5 s6) (next s6 s7) (next s7 s8) (next s8 s9) (next s9 s10)
    (next s10 s11) (next s11 s12) (next s12 s13) (next s13 s14) (next s14 s15)
    (next s15 s16) (next s16 s17) (next s17 s18) (next s18 s19) (next s19 s20)
    (next s20 s21) (next s21 s22) (next s22 s23) (next s23 s24) (next s24 s25)
    (next s25 s26) (next s26 s27) (next s27 s28) (next s28 s29) (next s29 s30)
    (next s30 s31)
  )

  (:goal
    (and
      ;; goal stacking on the middle peg: top-to-bottom a, b, c, d, e
      (on-disk a b)
      (on-disk b c)
      (on-disk c d)
      (on-disk d e)
      (on-peg e middle)

      ;; left and right pegs must be empty
      (clear-peg left)
      (clear-peg right)

      ;; end at final stage
      (curr s31)
    )
  )
)