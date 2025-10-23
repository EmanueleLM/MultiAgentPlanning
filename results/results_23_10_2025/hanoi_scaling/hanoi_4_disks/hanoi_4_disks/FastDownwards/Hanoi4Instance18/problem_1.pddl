(define (problem Hanoi4Instance18)
  (:domain hanoi-4)
  (:objects
    A B C D - disk
    left middle right - peg
  )

  (:init
    ;; initial stack on left peg (D bottom, then C, B, A top)
    (on D left)
    (on C D)
    (on B C)
    (on A B)

    ;; only top-most disk and empty pegs are clear initially
    (clear A)
    (clear middle)
    (clear right)

    ;; size ordering (strict): A < B < C < D
    (smaller A B)
    (smaller A C)
    (smaller A D)
    (smaller B C)
    (smaller B D)
    (smaller C D)
  )

  ;; Goal: all disks stacked on right peg in same order (D bottom ... A top)
  ;; and left & middle pegs empty
  (:goal (and
    (on D right)
    (on C D)
    (on B C)
    (on A B)
    (clear left)
    (clear middle)
  ))
)