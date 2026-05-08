(define (problem hanoi-5-problem)
  (:domain hanoi-5-domain)

  (:objects
    dA dB dC dD dE - disk
    left middle right - peg
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 s17 s18 s19 s20 s21 s22 s23 s24 s25 s26 s27 s28 s29 s30 s31 - step
  )

  (:init
    ;; immediate-on relations (bottom to top on middle peg)
    (on dE middle)
    (on dD dE)
    (on dC dD)
    (on dB dC)
    (on dA dB)

    ;; only the top disk and empty pegs are clear initially
    (clear dA)
    (clear left)
    (clear right)

    ;; static size ordering (smaller -> larger)
    (smaller dA dB) (smaller dA dC) (smaller dA dD) (smaller dA dE)
    (smaller dB dC) (smaller dB dD) (smaller dB dE)
    (smaller dC dD) (smaller dC dE)
    (smaller dD dE)

    ;; explicit stage successor chain (31 moves available)
    (next s0 s1) (next s1 s2) (next s2 s3) (next s3 s4) (next s4 s5) (next s5 s6)
    (next s6 s7) (next s7 s8) (next s8 s9) (next s9 s10) (next s10 s11) (next s11 s12)
    (next s12 s13) (next s13 s14) (next s14 s15) (next s15 s16) (next s16 s17)
    (next s17 s18) (next s18 s19) (next s19 s20) (next s20 s21) (next s21 s22)
    (next s22 s23) (next s23 s24) (next s24 s25) (next s25 s26) (next s26 s27)
    (next s27 s28) (next s28 s29) (next s29 s30) (next s30 s31)

    ;; initial global stage
    (at-step s0)
  )

  (:goal
    (and
      ;; final stack on the right peg (bottom to top)
      (on dE right)
      (on dD dE)
      (on dC dD)
      (on dB dC)
      (on dA dB)

      ;; both middle and left pegs must be empty at the terminal state
      (clear middle)
      (clear left)

      ;; top disk must be clear
      (clear dA)

      ;; require terminal stage to be reached explicitly
      (at-step s31)
    )
  )
)