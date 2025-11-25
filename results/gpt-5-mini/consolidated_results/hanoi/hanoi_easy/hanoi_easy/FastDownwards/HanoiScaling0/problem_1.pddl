(define (problem hanoi-problem)
  (:domain hanoi)
  (:objects
    A B C D - disk
    left middle right - peg
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 - stage
  )
  (:init
    ;; stage ordering and initial current stage
    (succ s0 s1) (succ s1 s2) (succ s2 s3) (succ s3 s4)
    (succ s4 s5) (succ s5 s6) (succ s6 s7) (succ s7 s8)
    (succ s8 s9) (succ s9 s10) (succ s10 s11) (succ s11 s12)
    (succ s12 s13) (succ s13 s14) (succ s14 s15)
    (at-stage s0)

    ;; initial stacking on the middle peg at stage s0 (top to bottom: A, B, C, D)
    (on A middle s0)
    (on B middle s0)
    (on C middle s0)
    (on D middle s0)
  )

  (:goal
    (and
      ;; All disks on the right peg at final stage s15
      (on A right s15)
      (on B right s15)
      (on C right s15)
      (on D right s15)

      ;; Both left and middle pegs must be empty at final stage
      (not (on A left s15)) (not (on B left s15)) (not (on C left s15)) (not (on D left s15))
      (not (on A middle s15)) (not (on B middle s15)) (not (on C middle s15)) (not (on D middle s15))

      ;; require that we reached stage s15 (ensures exactly 15 stage transitions / moves)
      (at-stage s15)
    )
  )
)