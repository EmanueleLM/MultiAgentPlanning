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

    ;; initial clear objects: top disk A and the two empty pegs
    (clear A)
    (clear middle)
    (clear right)

    ;; size ordering (A < B < C < D)
    (smaller A B)
    (smaller A C)
    (smaller A D)
    (smaller B C)
    (smaller B D)
    (smaller C D)
  )

  (:goal (and
    ;; goal: full tower A (top) on B on C on D (bottom) on the right peg
    (on A B)
    (on B C)
    (on C D)
    (on D right)
  ))
)