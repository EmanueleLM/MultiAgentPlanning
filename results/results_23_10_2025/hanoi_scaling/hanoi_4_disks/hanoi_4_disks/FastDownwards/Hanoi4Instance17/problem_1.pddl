(define (problem hanoi-4)
  (:domain hanoi-domain)
  (:objects
    A B C D - disk
    left middle right - peg
  )
  (:init
    ;; initial stack on left, top-to-bottom: A, B, C, D
    (on A B)
    (on B C)
    (on C D)
    (on D left)

    ;; clear: no disk on top
    (clear A)
    (clear middle)
    (clear right)

    ;; size ordering: A < B < C < D
    (smaller A B)
    (smaller A C)
    (smaller A D)
    (smaller B C)
    (smaller B D)
    (smaller C D)
  )
  (:goal (and
    ;; right peg should hold A (top) then B then C then D (bottom)
    (on A B)
    (on B C)
    (on C D)
    (on D right)
  ))
)