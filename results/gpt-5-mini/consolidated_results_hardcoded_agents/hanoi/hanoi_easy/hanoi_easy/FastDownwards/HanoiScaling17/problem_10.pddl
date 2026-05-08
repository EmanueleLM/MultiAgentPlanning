(define (problem hanoi-4-problem)
  (:domain hanoi-4-domain)
  (:objects
    dA dB dC dD - disk
    peg_left peg_mid peg_right - peg
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 - stage
  )
  (:init
    ;; initial stack on the right peg (top to bottom: dA, dB, dC, dD)
    (disk-on-peg dA peg_right)
    (disk-on-peg dB peg_right)
    (disk-on-peg dC peg_right)
    (disk-on-peg dD peg_right)

    (top-of-peg dA peg_right)
    (on dA dB)
    (on dB dC)
    (on dC dD)
    (bottom-of-peg dD peg_right)

    ;; left and middle pegs are empty initially
    (peg-empty peg_left)
    (peg-empty peg_mid)

    ;; static size ordering (from smallest to largest: dA < dB < dC < dD)
    (smaller-than dA dB) (smaller-than dA dC) (smaller-than dA dD)
    (smaller-than dB dC) (smaller-than dB dD)
    (smaller-than dC dD)

    ;; stage ordering and initial stage (16 stages for 15 moves)
    (next s0 s1) (next s1 s2) (next s2 s3) (next s3 s4) (next s4 s5)
    (next s5 s6) (next s6 s7) (next s7 s8) (next s8 s9) (next s9 s10)
    (next s10 s11) (next s11 s12) (next s12 s13) (next s13 s14) (next s14 s15)

    (current-stage s0)

    ;; explicit inequality facts for pegs
    (diff peg_left peg_mid) (diff peg_left peg_right)
    (diff peg_mid peg_left) (diff peg_mid peg_right)
    (diff peg_right peg_left) (diff peg_right peg_mid)
  )
  (:goal (and
    ;; all disks on middle peg in correct top-to-bottom order
    (disk-on-peg dA peg_mid)
    (disk-on-peg dB peg_mid)
    (disk-on-peg dC peg_mid)
    (disk-on-peg dD peg_mid)

    (top-of-peg dA peg_mid)
    (on dA dB)
    (on dB dC)
    (on dC dD)

    ;; left and right pegs empty
    (peg-empty peg_left)
    (peg-empty peg_right)

    ;; final stage reached exactly after 15 moves
    (current-stage s15)
  ))
)