(define (problem hanoi4)
  (:domain hanoi)

  (:objects
    A B C D - disk
    left middle right - peg
    s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 - step
  )

  (:init
    ;; initial stack on middle: top->bottom A on B, B on C, C on D, D on middle
    (on-peg D middle)
    (on-disk C D)
    (on-disk B C)
    (on-disk A B)

    ;; topmost disk A is clear; left and right pegs are empty
    (clear-disk A)
    (clear-peg left)
    (clear-peg right)

    ;; size ordering: A < B < C < D
    (smaller A B)
    (smaller A C)
    (smaller A D)
    (smaller B C)
    (smaller B D)
    (smaller C D)

    ;; step sequencing (contiguity) and initial current step
    (succ s1 s2)
    (succ s2 s3)
    (succ s3 s4)
    (succ s4 s5)
    (succ s5 s6)
    (succ s6 s7)
    (succ s7 s8)
    (succ s8 s9)
    (succ s9 s10)
    (succ s10 s11)
    (succ s11 s12)
    (succ s12 s13)
    (succ s13 s14)
    (succ s14 s15)
    (succ s15 s16)

    (current s1)
  )

  (:goal
    (and
      ;; final stack on right (top->bottom): A on B, B on C, C on D, D on right
      (on-disk A B)
      (on-disk B C)
      (on-disk C D)
      (on-peg D right)
      ;; final pegs left and middle must be empty
      (clear-peg left)
      (clear-peg middle)
      ;; top disk A must be clear
      (clear-disk A)
      ;; require reaching terminal step after 15 moves
      (current s16)
    )
  )
)