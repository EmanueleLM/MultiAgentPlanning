(define (problem hanoi-4)
  (:domain hanoi)
  (:objects
    A B C D - disk
    left middle right - peg
  )
  (:init
    ;; initial stack on left (top -> bottom): A, B, C, D
    (on A B)
    (on B C)
    (on C D)
    (on D left)

    ;; clear predicates: top disk A is clear; empty pegs are clear
    (clear A)
    (clear middle)
    (clear right)

    ;; size ordering (static)
    (smaller A B)
    (smaller A C)
    (smaller A D)
    (smaller B C)
    (smaller B D)
    (smaller C D)
  )

  ;; Goal: entire stack A (top) -> B -> C -> D (bottom) is on peg right.
  (:goal (and
    (on A B)
    (on B C)
    (on C D)
    (on D right)
  ))
)