(define (problem orchestrator-problem)
  (:domain orchestrator-domain)

  (:objects
    left middle right - peg
    A B C D - disk
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 - step
  )

  (:init
    ;; initial physical configuration on the MIDDLE peg (top-to-bottom: A, B, C, D)
    ;; representation: bottom disk is directly on the peg; each disk above is directly on the disk below it.
    (on-peg D middle)   ;; D is the largest, at bottom on the middle peg
    (on-disk C D)
    (on-disk B C)
    (on-disk A B)       ;; A is the smallest, topmost

    ;; clear markers: only the top disk (A) has nothing on it; empty pegs are clear
    (clear-disk A)
    (clear-peg left)
    (clear-peg right)

    ;; strict size ordering (A smallest, D largest)
    (smaller A B)
    (smaller A C)
    (smaller A D)
    (smaller B C)
    (smaller B D)
    (smaller C D)

    ;; explicit step chain for exactly 15 moves: s0 -> s15 (contiguous progression enforced)
    (succ s0 s1) (succ s1 s2) (succ s2 s3) (succ s3 s4)
    (succ s4 s5) (succ s5 s6) (succ s6 s7) (succ s7 s8)
    (succ s8 s9) (succ s9 s10) (succ s10 s11) (succ s11 s12)
    (succ s12 s13) (succ s13 s14) (succ s14 s15)

    (current-step s0)
  )

  (:goal
    (and
      ;; all disks stacked on RIGHT in correct order (top-to-bottom A,B,C,D)
      (on-peg D right)
      (on-disk C D)
      (on-disk B C)
      (on-disk A B)
      (clear-disk A)

      ;; left and middle pegs must be empty at the end
      (clear-peg left)
      (clear-peg middle)

      ;; enforce exactly 15 moves by requiring final explicit step reached
      (current-step s15)
    )
  )
)