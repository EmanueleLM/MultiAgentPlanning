(define (problem hanoi-problem)
  (:domain hanoi)
  (:objects
    a b c d - disk
    left middle right - peg
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 - stage
  )

  (:init
    ;; stage chain and starting stage
    (succ s0 s1) (succ s1 s2) (succ s2 s3) (succ s3 s4)
    (succ s4 s5) (succ s5 s6) (succ s6 s7) (succ s7 s8)
    (succ s8 s9) (succ s9 s10) (succ s10 s11) (succ s11 s12)
    (succ s12 s13) (succ s13 s14) (succ s14 s15)
    (at-stage s0)

    ;; initial stacking on the middle peg (top to bottom): a on b, b on c, c on d, d on middle
    (on-disk a b)
    (on-disk b c)
    (on-disk c d)
    (on-peg d middle)

    ;; top/clear facts initially
    (clear-disk a)
    (clear-peg left)
    (clear-peg right)

    ;; static size ordering (a smallest, d largest)
    (smaller a b) (smaller a c) (smaller a d)
    (smaller b c) (smaller b d)
    (smaller c d)
  )

  (:goal (and
    ;; final stacking on the right peg (top to bottom): a on b, b on c, c on d, d on right
    (on-disk a b)
    (on-disk b c)
    (on-disk c d)
    (on-peg d right)

    ;; left and middle pegs must be empty (no disk directly on them)
    (not (on-peg a left)) (not (on-peg b left)) (not (on-peg c left)) (not (on-peg d left))
    (not (on-peg a middle)) (not (on-peg b middle)) (not (on-peg c middle)) (not (on-peg d middle))

    ;; require reaching final discrete stage (ensures the planner advances stages)
    (at-stage s15)
  ))
)