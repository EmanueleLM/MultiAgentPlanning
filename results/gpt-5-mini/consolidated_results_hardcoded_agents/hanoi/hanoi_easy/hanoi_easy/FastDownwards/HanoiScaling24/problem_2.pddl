(define (problem hanoi-4-3pegs-problem)
  (:domain hanoi-4disks-3pegs)

  (:objects
    ; disks (A = smallest, D = largest)
    A B C D - obj
    ; pegs
    left middle right - obj
    ; explicit stages for sequential ordering (15 moves => 16 stages s0..s15)
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 - stage
  )

  (:init
    ; classify objects
    (disk A) (disk B) (disk C) (disk D)
    (peg left) (peg middle) (peg right)

    ; initial stack on the middle peg (top to bottom: A, B, C, D)
    (on A middle)
    (on B A)
    (on C B)
    (on D C)

    ; clear facts at start: top disk A is clear; empty pegs left and right are clear
    (clear A)
    (clear left)
    (clear right)

    ; size ordering (A < B < C < D)
    (smaller A B) (smaller A C) (smaller A D)
    (smaller B C) (smaller B D)
    (smaller C D)

    ; stage successor chain and initial current stage
    (succ s0 s1) (succ s1 s2) (succ s2 s3) (succ s3 s4) (succ s4 s5)
    (succ s5 s6) (succ s6 s7) (succ s7 s8) (succ s8 s9) (succ s9 s10)
    (succ s10 s11) (succ s11 s12) (succ s12 s13) (succ s13 s14) (succ s14 s15)

    (current s0)
  )

  (:goal
    (and
      ; final tower on the right peg top-to-bottom A,B,C,D
      (on A B)
      (on B C)
      (on C D)
      (on D right)

      ; left and middle pegs must be empty (clear)
      (clear left)
      (clear middle)

      ; enforce that plan reaches the final stage (ensures exact sequencing through stages)
      (current s15)
    )
  )
)