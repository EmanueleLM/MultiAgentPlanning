(define (problem hanoi-5-right-to-left)
  (:domain hanoi)
  (:objects
    A B C D E - disk
    left middle right - peg
  )

  (:init
    ;; size ordering: A < B < C < D < E
    (smaller A B) (smaller A C) (smaller A D) (smaller A E)
    (smaller B C) (smaller B D) (smaller B E)
    (smaller C D) (smaller C E)
    (smaller D E)

    ;; Initial immediate-support chain on the right peg (top-to-bottom): A on B, B on C, C on D, D on E, E on right
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E right)

    ;; clear (nothing immediately on): top disk A, and empty pegs left and middle
    (clear A)
    (clear left)
    (clear middle)
    ;; right is not clear (E is on right); B, C, D, E are not clear except as listed above
  )

  (:goal (and
    ;; final immediate-support chain on the left peg: A on B, B on C, C on D, D on E, E on left
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E left)

    ;; middle and right must be empty (no disk immediately on them)
    (clear middle)
    (clear right)
  ))