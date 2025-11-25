(define (problem hanoi4)
  (:domain hanoi)
  (:objects
    A B C D - disk
    left middle right - peg
  )

  (:init
    ;; initial stacking on the middle peg: top A, then B, then C, then D (bottom)
    (on A middle)
    (on B A)
    (on C B)
    (on D C)
    (top A middle)

    ;; pegs left and right are empty initially; middle is not declared empty
    (empty left)
    (empty right)

    ;; size ordering (A smallest, then B, then C, then D)
    (smaller A B)
    (smaller A C)
    (smaller A D)
    (smaller B C)
    (smaller B D)
    (smaller C D)
  )

  (:goal (and
    ;; final stacking on the right peg: top A, then B, then C, then D (bottom)
    (on A right)
    (on B A)
    (on C B)
    (on D C)
    (top A right)

    ;; left and middle pegs must be empty at the end (hard constraints)
    (empty left)
    (empty middle)
  ))
)