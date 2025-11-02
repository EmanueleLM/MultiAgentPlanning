(define (problem hanoi-4)
  (:domain hanoi)

  (:objects
    A B C D - disk
    left middle right - peg
  )

  (:init
    ;; initial direct-on relationships (top-to-bottom: A,B,C,D on left)
    (on A B)
    (on B C)
    (on C D)
    (on D left)

    ;; initial clear facts: top disk A is clear, middle and right pegs are empty (clear)
    (clear A)
    (clear middle)
    (clear right)

    ;; size ordering (A smallest, then B, then C, then D largest)
    (smaller A B)
    (smaller A C)
    (smaller A D)
    (smaller B C)
    (smaller B D)
    (smaller C D)
  )

  (:goal
    (and
      ;; goal stack on right: top->bottom A, B, C, D
      (on A B)
      (on B C)
      (on C D)
      (on D right)

      ;; ensure left and middle are empty in the goal configuration
      (clear left)
      (clear middle)
    )
  )
)