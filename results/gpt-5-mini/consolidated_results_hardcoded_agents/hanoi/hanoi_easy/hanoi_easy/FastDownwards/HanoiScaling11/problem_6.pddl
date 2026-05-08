(define (problem hanoi-4)
  (:domain hanoi)
  (:objects
    left middle right - peg
    A B C D - disk
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 - stage
  )
  (:init
    ;; size ordering
    (smaller A B) (smaller A C) (smaller A D)
    (smaller B C) (smaller B D)
    (smaller C D)

    ;; initial stack on middle: top A, then B on C on D, D on middle peg
    (on-disk A B)
    (on-disk B C)
    (on-disk C D)
    (on-peg D middle)
    (top A middle)

    ;; empty pegs
    (empty left)
    (empty right)

    ;; ordered stages for 15 moves (2^4 - 1 = 15)
    (succ s0 s1) (succ s1 s2) (succ s2 s3) (succ s3 s4)
    (succ s4 s5) (succ s5 s6) (succ s6 s7) (succ s7 s8)
    (succ s8 s9) (succ s9 s10) (succ s10 s11) (succ s11 s12)
    (succ s12 s13) (succ s13 s14) (succ s14 s15)

    (current s0)
  )
  (:goal (and
    ;; target: entire stack on right peg in same order A on B on C on D, right has D at bottom
    (on-disk A B)
    (on-disk B C)
    (on-disk C D)
    (on-peg D right)
    (top A right)

    ;; left and middle must be empty
    (empty left)
    (empty middle)

    ;; must have reached final stage
    (current s15)
  ))
)