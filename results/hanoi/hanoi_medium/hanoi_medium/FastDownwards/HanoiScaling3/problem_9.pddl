(define (problem hanoi_5_staged)
  (:domain hanoi_staged)
  (:objects
    dA dB dC dD dE - disk
    left middle right - peg
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 s17 s18 s19 s20 s21 s22 s23 s24 s25 s26 s27 s28 s29 s30 s31 - stage
  )

  (:init
    ;; initial stack on left peg: bottom dE, then dD, dC, dB, top dA
    (on-p dE left)
    (on-d dD dE)
    (on-d dC dD)
    (on-d dB dC)
    (on-d dA dB)

    ;; only the topmost disk is clear; other pegs are empty
    (clear-d dA)
    (clear-p middle)
    (clear-p right)

    ;; stage successor chain for 31 moves: s0 -> s1 -> ... -> s31
    (succ s0 s1) (succ s1 s2) (succ s2 s3) (succ s3 s4) (succ s4 s5)
    (succ s5 s6) (succ s6 s7) (succ s7 s8) (succ s8 s9) (succ s9 s10)
    (succ s10 s11) (succ s11 s12) (succ s12 s13) (succ s13 s14) (succ s14 s15)
    (succ s15 s16) (succ s16 s17) (succ s17 s18) (succ s18 s19) (succ s19 s20)
    (succ s20 s21) (succ s21 s22) (succ s22 s23) (succ s23 s24) (succ s24 s25)
    (succ s25 s26) (succ s26 s27) (succ s27 s28) (succ s28 s29) (succ s29 s30)
    (succ s30 s31)

    ;; initial current stage
    (current-stage s0)

    ;; size ordering between disks (dA smallest ... dE largest)
    (smaller dA dB) (smaller dA dC) (smaller dA dD) (smaller dA dE)
    (smaller dB dC) (smaller dB dD) (smaller dB dE)
    (smaller dC dD) (smaller dC dE)
    (smaller dD dE)
  )

  (:goal (and
    ;; final stack on right peg: bottom dE, then dD, dC, dB, top dA
    (on-p dE right)
    (on-d dD dE)
    (on-d dC dD)
    (on-d dB dC)
    (on-d dA dB)

    ;; left and middle pegs must be empty
    (clear-p left)
    (clear-p middle)

    ;; enforce completion of the exact sequence of 31 moves
    (current-stage s31)
  ))