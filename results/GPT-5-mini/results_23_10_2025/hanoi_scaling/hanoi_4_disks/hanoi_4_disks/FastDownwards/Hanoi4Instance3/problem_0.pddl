(define (problem hanoi-4)
  (:domain hanoi)
  (:objects
    A B C D - disk
    left middle right - peg
  )
  (:init
    ;; stack on left peg: top->bottom A, B, C, D
    (on A B)
    (on B C)
    (on C D)
    (on D left)

    ;; top-of-stack / emptiness facts
    (clear A)
    (clear middle)
    (clear right)

    ;; size ordering (smaller x y means x is smaller than y)
    (smaller A B)
    (smaller A C)
    (smaller A D)
    (smaller B C)
    (smaller B D)
    (smaller C D)
  )
  (:goal (and
    ;; goal: right peg holds top->bottom A, B, C, D
    (on A B)
    (on B C)
    (on C D)
    (on D right)
  ))
)