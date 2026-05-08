(define (problem orchestrator-problem)
  (:domain orchestrator-domain)

  (:objects
    left middle right - peg
    d1 d2 d3 d4 - disk
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 - step
  )

  (:init
    ;; initial physical configuration on the MIDDLE peg (top-to-bottom: d1, d2, d3, d4)
    ;; representation: bottom disk is directly on the peg; each disk above is on the disk below it.
    (on-peg d4 middle)
    (on-disk d3 d4)
    (on-disk d2 d3)
    (on-disk d1 d2)

    ;; clear markers: only the top disk (d1) has nothing on it; empty pegs are clear
    (clear-disk d1)
    (clear-peg left)
    (clear-peg right)

    ;; strict size ordering (smallest to largest)
    (smaller d1 d2)
    (smaller d1 d3)
    (smaller d1 d4)
    (smaller d2 d3)
    (smaller d2 d4)
    (smaller d3 d4)

    ;; explicit step chain for exactly 15 moves: s0 -> s15
    (succ s0 s1) (succ s1 s2) (succ s2 s3) (succ s3 s4)
    (succ s4 s5) (succ s5 s6) (succ s6 s7) (succ s7 s8)
    (succ s8 s9) (succ s9 s10) (succ s10 s11) (succ s11 s12)
    (succ s12 s13) (succ s13 s14) (succ s14 s15)

    (current-step s0)
  )

  (:goal
    (and
      ;; all disks stacked on RIGHT in correct order (top-to-bottom d1,d2,d3,d4)
      (on-peg d4 right)
      (on-disk d3 d4)
      (on-disk d2 d3)
      (on-disk d1 d2)
      (clear-disk d1)

      ;; left and middle pegs must be empty at the end
      (clear-peg left)
      (clear-peg middle)

      ;; enforce exactly 15 moves by requiring final explicit step reached
      (current-step s15)
    )
  )
)