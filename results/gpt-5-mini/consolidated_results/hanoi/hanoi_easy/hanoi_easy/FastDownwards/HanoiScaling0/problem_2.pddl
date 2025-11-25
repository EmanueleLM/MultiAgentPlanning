(define (problem hanoi-problem)
  (:domain hanoi)
  (:objects
    A B C D - disk
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

    ;; initial stacking on the middle peg (top to bottom): A on B, B on C, C on D, D on middle
    (on-disk A B)
    (on-disk B C)
    (on-disk C D)
    (on-peg D middle)

    ;; top/clear facts initially
    (clear-disk A)
    (clear-peg left)
    (clear-peg right)
    ;; middle peg not clear (D sits on it); disks B,C,D are not clear (they have something above them)

    ;; static size ordering (A smallest, D largest)
    (smaller A B) (smaller A C) (smaller A D)
    (smaller B C) (smaller B D)
    (smaller C D)
  )

  (:goal (and
    ;; All disks on the right peg in the same order (top to bottom: A on B, B on C, C on D, D on right)
    (on-disk A B)
    (on-disk B C)
    (on-disk C D)
    (on-peg D right)

    ;; left and middle pegs must be empty at the final stage (no disk on them)
    (not (on-peg A left)) (not (on-peg B left)) (not (on-peg C left)) (not (on-peg D left))
    (not (on-peg A middle)) (not (on-peg B middle)) (not (on-peg C middle)) (not (on-peg D middle))

    ;; also require the planner reached the final stage (ensures exactly 15 moves / transitions)
    (at-stage s15)
  ))
)