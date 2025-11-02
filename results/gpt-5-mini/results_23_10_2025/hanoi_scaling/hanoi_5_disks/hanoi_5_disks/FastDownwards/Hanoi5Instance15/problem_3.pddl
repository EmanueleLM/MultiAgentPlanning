(define (problem Hanoi5Instance15-problem)
  (:domain hanoi5)
  (:objects
    A B C D E - disk
    left middle right - peg
  )
  (:init
    ;; initial stack on left: top A, then B, C, D, E at bottom (E on left)
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E left)

    ;; clear facts: only the top-most disk and empty pegs are clear
    (clear A)
    (clear middle)
    (clear right)

    ;; size ordering (smaller)
    (smaller A B) (smaller A C) (smaller A D) (smaller A E)
    (smaller B C) (smaller B D) (smaller B E)
    (smaller C D) (smaller C E)
    (smaller D E)
  )
  (:goal (and
    ;; goal: entire stack moved to right preserving order
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E right)
  ))
)