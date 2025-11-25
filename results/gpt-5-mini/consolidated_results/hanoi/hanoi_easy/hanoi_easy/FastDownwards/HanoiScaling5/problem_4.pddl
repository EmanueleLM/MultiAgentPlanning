(define (problem hanoi-4)
  (:domain hanoi)
  (:objects
    left middle right - peg
    a b c d - disk
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 - step
  )
  (:init
    ;; Initial stack on the RIGHT peg: from top to bottom a b c d
    (on-peg d right)
    (on-disk c d)
    (on-disk b c)
    (on-disk a b)

    ;; bookkeeping: top-of-peg: right has top a; left and middle empty
    (top right a)
    (top-peg-empty left)
    (top-peg-empty middle)

    ;; clear: only top disk a is clear
    (clear a)

    ;; size ordering (smaller relations) a < b < c < d
    (smaller a b) (smaller a c) (smaller a d)
    (smaller b c) (smaller b d)
    (smaller c d)

    ;; step progression: start at s0
    (current-step s0)
    (succ s0 s1) (succ s1 s2) (succ s2 s3) (succ s3 s4)
    (succ s4 s5) (succ s5 s6) (succ s6 s7) (succ s7 s8)
    (succ s8 s9) (succ s9 s10) (succ s10 s11) (succ s11 s12)
    (succ s12 s13) (succ s13 s14) (succ s14 s15)
  )
  (:goal (and
    ;; All disks moved to LEFT peg in correct order: d on peg, c on d, b on c, a on b
    (on-peg d left)
    (on-disk c d)
    (on-disk b c)
    (on-disk a b)
    ;; intermediate pegs must end up empty
    (top-peg-empty middle)
    (top-peg-empty right)
    ;; require the plan to have progressed to the final step (15 moves)
    (current-step s15)
  ))