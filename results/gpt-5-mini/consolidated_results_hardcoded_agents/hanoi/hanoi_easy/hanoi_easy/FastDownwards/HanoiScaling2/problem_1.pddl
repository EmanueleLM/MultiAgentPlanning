(define (problem hanoi-4-disks-left-to-right)
  (:domain hanoi-domain)

  (:objects
    A B C D - disk
    left middle right - peg
    ;; steps: s0 is the initial stage; s1..s15 provide explicit, ordered stages to enforce contiguous moves
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 - step
  )

  (:init
    ;; Temporal ordering: successive discrete stages
    (succ s0 s1) (succ s1 s2) (succ s2 s3) (succ s3 s4)
    (succ s4 s5) (succ s5 s6) (succ s6 s7) (succ s7 s8)
    (succ s8 s9) (succ s9 s10) (succ s10 s11) (succ s11 s12)
    (succ s12 s13) (succ s13 s14) (succ s14 s15)

    ;; Stage availability: only s0 is initially produced; all later stages are free to be produced once
    (not (free-step s0))
    (free-step s1) (free-step s2) (free-step s3) (free-step s4)
    (free-step s5) (free-step s6) (free-step s7) (free-step s8)
    (free-step s9) (free-step s10) (free-step s11) (free-step s12)
    (free-step s13) (free-step s14) (free-step s15)

    ;; Initial stack at stage s0: bottom D on left, then C on D, then B on C, then A on B
    (on D left s0)
    (on C D s0)
    (on B C s0)
    (on A B s0)

    ;; Clear/top facts at stage s0:
    (clear A s0)        ; A is top of the left stack at s0
    (clear middle s0)   ; middle peg empty
    (clear right s0)    ; right peg empty
    ;; other clear facts at s0 (implicitly false / absent): B, C, D, left are not clear at s0

    ;; Size ordering (explicit)
    (smaller A B) (smaller A C) (smaller A D)
    (smaller B C) (smaller B D)
    (smaller C D)
  )

  (:goal (and
    ;; All disks must be stacked on the right peg at the final produced stage s15:
    (on D right s15)
    (on C D s15)
    (on B C s15)
    (on A B s15)

    ;; Hard constraint: left and middle pegs must be empty in the final produced stage
    (clear left s15)
    (clear middle s15)
  ))
)