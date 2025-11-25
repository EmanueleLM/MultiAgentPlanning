(define (problem hanoi_5_problem_ordered)
  (:domain hanoi_5_ordered)
  (:objects
    a b c d e - disk
    left middle right - peg
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 s17 s18 s19 s20 s21 s22 s23 s24 s25 s26 s27 s28 s29 s30 s31 - stage
  )

  (:init
    ;; Initial stack on right peg: top a, then b, c, d, e (e directly on peg right)
    (on-disk a b)
    (on-disk b c)
    (on-disk c d)
    (on-disk d e)
    (on-peg e right)

    ;; top-of-stack marker
    (clear-disk a)

    ;; empty pegs initially (left and middle empty)
    (clear-peg left)
    (clear-peg middle)

    ;; size ordering (static)
    (smaller a b) (smaller a c) (smaller a d) (smaller a e)
    (smaller b c) (smaller b d) (smaller b e)
    (smaller c d) (smaller c e)
    (smaller d e)

    ;; stage successor chain for 31 moves (s0 -> s31)
    (succ s0 s1) (succ s1 s2) (succ s2 s3) (succ s3 s4) (succ s4 s5)
    (succ s5 s6) (succ s6 s7) (succ s7 s8) (succ s8 s9) (succ s9 s10)
    (succ s10 s11) (succ s11 s12) (succ s12 s13) (succ s13 s14) (succ s14 s15)
    (succ s15 s16) (succ s16 s17) (succ s17 s18) (succ s18 s19) (succ s19 s20)
    (succ s20 s21) (succ s21 s22) (succ s22 s23) (succ s23 s24) (succ s24 s25)
    (succ s25 s26) (succ s26 s27) (succ s27 s28) (succ s28 s29) (succ s29 s30)
    (succ s30 s31)

    ;; initial current stage
    (now s0)
  )

  (:goal
    (and
      ;; goal stack on middle peg: e bottom on peg middle, then d on e, c on d, b on c, a on b
      (on-peg e middle)
      (on-disk d e)
      (on-disk c d)
      (on-disk b c)
      (on-disk a b)
      ;; left and right pegs empty at the end
      (clear-peg left)
      (clear-peg right)
      ;; require final stage reached exactly (enforces exact number of moves)
      (now s31)
    )
  )
)