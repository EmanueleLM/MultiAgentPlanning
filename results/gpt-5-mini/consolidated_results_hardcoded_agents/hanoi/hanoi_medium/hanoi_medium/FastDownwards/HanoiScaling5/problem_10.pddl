(define (problem hanoi-5-problem)
  (:domain hanoi-5)

  (:objects
    ;; disks smallest to largest
    a b c d e - disk

    ;; pegs
    left mid right - peg

    ;; discrete ordered steps: s0..s31 (31 moves needed for 5 disks)
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 s17 s18 s19 s20 s21 s22 s23 s24 s25 s26 s27 s28 s29 s30 s31 - step
  )

  (:init
    ;; initial stack on the right peg: from bottom to top e, d, c, b, a
    (on e right)
    (on d e)
    (on c d)
    (on b c)
    (on a b)

    ;; which places are initially clear: top disk a is clear; left and mid pegs are empty (clear)
    (clear a)
    (clear left)
    (clear mid)

    ;; size ordering (strict)
    (smaller a b) (smaller a c) (smaller a d) (smaller a e)
    (smaller b c) (smaller b d) (smaller b e)
    (smaller c d) (smaller c e)
    (smaller d e)

    ;; stage progression: start at s0 and provide a contiguous chain of successors to s31
    (current s0)
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
      ;; final stack on left peg: from bottom to top e, d, c, b, a
      (on e left)
      (on d e)
      (on c d)
      (on b c)
      (on a b)

      ;; top disk clear and both other pegs empty (no disk directly on them)
      (clear a)
      (clear mid)
      (clear right)

      ;; final stage reached exactly
      (current s31)
    )
  )
)