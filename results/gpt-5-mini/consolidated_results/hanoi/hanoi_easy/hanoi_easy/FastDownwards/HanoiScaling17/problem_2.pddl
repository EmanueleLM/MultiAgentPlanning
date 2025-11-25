(define (problem hanoi-4-problem)
  (:domain hanoi-4-domain)
  (:objects
    dA dB dC dD - disk
    peg_left peg_mid peg_right - peg
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 - stage
  )
  (:init
    ;; initial stack on the right peg (from top to bottom: dA, dB, dC, dD)
    (disk-on-peg dA peg_right)
    (disk-on-peg dB peg_right)
    (disk-on-peg dC peg_right)
    (disk-on-peg dD peg_right)

    (top-of-peg dA peg_right)
    (on-disk dA dB)
    (on-disk dB dC)
    (on-disk dC dD)
    (no-under dD)

    ;; other pegs empty initially
    (peg-empty peg_left)
    (peg-empty peg_mid)

    ;; size ordering: dA < dB < dC < dD
    (smaller-than dA dB) (smaller-than dA dC) (smaller-than dA dD)
    (smaller-than dB dC) (smaller-than dB dD)
    (smaller-than dC dD)

    ;; stage ordering and initial current stage
    (next s0 s1) (next s1 s2) (next s2 s3) (next s3 s4) (next s4 s5)
    (next s5 s6) (next s6 s7) (next s7 s8) (next s8 s9) (next s9 s10)
    (next s10 s11) (next s11 s12) (next s12 s13) (next s13 s14) (next s14 s15)

    (current-stage s0)
  )
  (:goal (and
    ;; all disks must be on middle peg in correct stack order
    (disk-on-peg dA peg_mid)
    (disk-on-peg dB peg_mid)
    (disk-on-peg dC peg_mid)
    (disk-on-peg dD peg_mid)

    (top-of-peg dA peg_mid)
    (on-disk dA dB)
    (on-disk dB dC)
    (on-disk dC dD)

    ;; left and right pegs must be empty at goal
    (peg-empty peg_left)
    (peg-empty peg_right)

    ;; require that exactly 15 moves were performed by advancing the stage to s15
    (current-stage s15)
  ))
)