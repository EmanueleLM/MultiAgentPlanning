(define (problem hanoi_5_problem_ordered)
  (:domain hanoi_5_ordered)
  (:objects
    A B C D E - disk
    left middle right - peg
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 s17 s18 s19 s20 s21 s22 s23 s24 s25 s26 s27 s28 s29 s30 s31 - stage
  )

  (:init
    ;; Initial stack on right peg: top A, then B, C, D, E (E at bottom on peg right)
    (on-disk A B)
    (on-disk B C)
    (on-disk C D)
    (on-disk D E)
    (on-peg E right)

    ;; Top-of-stack and empty pegs
    (clear-disk A)
    (clear-peg left)
    (clear-peg middle)
    ;; right peg is not clear initially (implicitly false)
    ;; disks B..E not clear implicitly

    ;; Static size ordering (smaller relations)
    (smaller A B) (smaller A C) (smaller A D) (smaller A E)
    (smaller B C) (smaller B D) (smaller B E)
    (smaller C D) (smaller C E)
    (smaller D E)

    ;; Stage successor chain: allows exactly 31 transitions (s0->s1 ... s30->s31).
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
      ;; Goal stack on middle peg: E bottom on peg middle, then D on E, C on D, B on C, A on B
      (on-peg E middle)
      (on-disk D E)
      (on-disk C D)
      (on-disk B C)
      (on-disk A B)
      ;; left and right pegs must be empty at the end
      (clear-peg left)
      (clear-peg right)
    )
  )
)