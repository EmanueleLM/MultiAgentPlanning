(define (problem orchestrator-problem)
  (:domain orchestrator-domain)

  (:objects
    left middle right - peg
    a b c d - disk
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 - step
  )

  (:init
    ;; Initial stack on middle: top-to-bottom a, b, c, d
    ;; Representation: bottom disk directly on peg; others on-disk chaining upward.
    (on-peg d middle)
    (on-disk c d)
    (on-disk b c)
    (on-disk a b)

    ;; Top markers and empty pegs
    (clear-disk a)
    (clear-peg left)
    (clear-peg right)
    ;; middle is not clear (no fact), since it holds disks

    ;; Disk size ordering (a smallest, d largest)
    (smaller a b) (smaller a c) (smaller a d)
    (smaller b c) (smaller b d)
    (smaller c d)

    ;; explicit contiguous step chain for exactly 15 moves (2^4 - 1 = 15)
    (succ s0 s1) (succ s1 s2) (succ s2 s3) (succ s3 s4)
    (succ s4 s5) (succ s5 s6) (succ s6 s7) (succ s7 s8)
    (succ s8 s9) (succ s9 s10) (succ s10 s11) (succ s11 s12)
    (succ s12 s13) (succ s13 s14) (succ s14 s15)

    (current-step s0)
  )

  (:goal
    (and
      ;; all disks stacked on right in correct order (top-to-bottom a,b,c,d)
      (on-peg d right)
      (on-disk c d)
      (on-disk b c)
      (on-disk a b)
      (clear-disk a)

      ;; left and middle pegs empty at the end
      (clear-peg left)
      (clear-peg middle)

      ;; require reaching final explicit step to enforce exactly 15 moves
      (current-step s15)
    )
  )
)