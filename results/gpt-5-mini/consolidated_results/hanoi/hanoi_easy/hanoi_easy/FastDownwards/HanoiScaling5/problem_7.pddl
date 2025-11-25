(define (problem hanoi-4)
  (:domain hanoi)
  (:objects
    left middle right - peg
    a b c d - disk
    ;; steps s0..s15 allow one action per step; 15 moves required for 4 disks
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 - step
  )
  (:init
    ;; initial stacked configuration on the right peg: top-to-bottom a b c d
    (on-peg d right)
    (on-disk c d)
    (on-disk b c)
    (on-disk a b)
    (top right a)
    ;; other pegs empty
    (top-peg-empty left)
    (top-peg-empty middle)
    ;; clear markers: top disk has nothing on it
    (clear a)
    ;; size ordering facts (smaller relationships)
    (smaller a b) (smaller a c) (smaller a d)
    (smaller b c) (smaller b d)
    (smaller c d)
    ;; step control: start at s0 and explicit successor chain to s15
    (current-step s0)
    (succ s0 s1) (succ s1 s2) (succ s2 s3) (succ s3 s4)
    (succ s4 s5) (succ s5 s6) (succ s6 s7) (succ s7 s8)
    (succ s8 s9) (succ s9 s10) (succ s10 s11) (succ s11 s12)
    (succ s12 s13) (succ s13 s14) (succ s14 s15)
  )
  (:goal (and
    ;; final stacked configuration on the left peg: top-to-bottom a b c d
    (on-peg d left)
    (on-disk c d)
    (on-disk b c)
    (on-disk a b)
    ;; middle and right pegs must be empty
    (top-peg-empty middle)
    (top-peg-empty right)
    ;; execution must reach final step
    (current-step s15)
  ))
)