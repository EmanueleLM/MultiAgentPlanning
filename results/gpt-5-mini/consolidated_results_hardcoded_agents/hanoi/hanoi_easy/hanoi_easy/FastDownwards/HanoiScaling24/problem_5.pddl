(define (problem hanoi-4-3pegs-problem)
  (:domain hanoi-4disks-3pegs)

  (:objects
    ;; disks (a = smallest, d = largest)
    a b c d - disk
    ;; pegs
    left middle right - peg
    ;; explicit stages for sequential ordering (15 moves => 16 stages s0..s15)
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 - stage
  )

  (:init
    ;; initial stack on the middle peg (top to bottom: a, b, c, d)
    ;; direct "on" relations (each disk directly on the thing under it)
    (on a b)
    (on b c)
    (on c d)
    (on d middle)

    ;; topmost and empty-place clear facts at start
    (clear a)
    (clear left)
    (clear right)

    ;; size ordering (a < b < c < d) -- static facts
    (smaller a b) (smaller a c) (smaller a d)
    (smaller b c) (smaller b d)
    (smaller c d)

    ;; explicit stage successor chain and initial current stage
    (succ s0 s1) (succ s1 s2) (succ s2 s3) (succ s3 s4) (succ s4 s5)
    (succ s5 s6) (succ s6 s7) (succ s7 s8) (succ s8 s9) (succ s9 s10)
    (succ s10 s11) (succ s11 s12) (succ s12 s13) (succ s13 s14) (succ s14 s15)

    (current s0)
  )

  (:goal
    (and
      ;; final tower on the right peg top-to-bottom a,b,c,d
      (on a b)
      (on b c)
      (on c d)
      (on d right)

      ;; left and middle pegs must be empty (topmost = clear)
      (clear left)
      (clear middle)

      ;; final stage reached (enforces plan used the stage progression)
      (current s15)
    )
  )
)