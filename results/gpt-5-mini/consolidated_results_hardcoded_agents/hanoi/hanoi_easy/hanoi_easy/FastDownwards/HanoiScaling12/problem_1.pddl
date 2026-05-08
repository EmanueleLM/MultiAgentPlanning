(define (problem hanoi4-problem)
  (:domain hanoi4)

  ;; Objects: three pegs, four disks, and explicit step objects modeling discrete time
  (:objects
    A B C D - disk
    left middle right - peg

    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 - step
  )

  ;; Initial world state:
  ;; - Right peg holds stack top->bottom: A, B, C, D
  ;; - Left and middle pegs are empty
  ;; - Size relations: A < B < C < D
  ;; - Sequencing: current-step is s0 and successor chain s0->s1->...->s15
  (:init
    ;; typing facts (explicit)
    (disk A) (disk B) (disk C) (disk D)
    (peg left) (peg middle) (peg right)
    (step s0) (step s1) (step s2) (step s3) (step s4) (step s5) (step s6) (step s7)
    (step s8) (step s9) (step s10) (step s11) (step s12) (step s13) (step s14) (step s15)

    ;; Initial stacks represented by direct-support relations:
    ;; A on B, B on C, C on D, and D on right peg. A is top of right peg.
    (on-disk A B)
    (on-disk B C)
    (on-disk C D)
    (on-peg D right)
    (top A right)

    ;; Left and middle are empty initially
    (empty left)
    (empty middle)

    ;; Size relations: A < B < C < D
    (smaller A B) (smaller A C) (smaller A D)
    (smaller B C) (smaller B D)
    (smaller C D)

    ;; Sequencing: chain of steps and start at s0
    (succ s0 s1) (succ s1 s2) (succ s2 s3) (succ s3 s4)
    (succ s4 s5) (succ s5 s6) (succ s6 s7) (succ s7 s8)
    (succ s8 s9) (succ s9 s10) (succ s10 s11) (succ s11 s12)
    (succ s12 s13) (succ s13 s14) (succ s14 s15)

    (current-step s0)
  )

  ;; Goal: the left peg must hold the full stack top-to-bottom A,B,C,D and both middle and right must be empty.
  ;; Also require that the plan has advanced to step s15 (i.e., exactly 15 moves have been performed).
  (:goal (and
    ;; left stack structure
    (top A left)
    (on-disk A B)
    (on-disk B C)
    (on-disk C D)
    (on-peg D left)

    ;; enforce middle and right empty as required
    (empty middle)
    (empty right)

    ;; require contiguous progression to the terminal step (15 moves)
    (current-step s15)
  ))
)