(define (problem hanoi-6-left-to-right)
  (:domain tower-of-hanoi)
  (:objects
    left middle right - peg
    A B C D E F - disk
  )
  (:init
    ;; Initial stacking on left peg: top-to-bottom A B C D E F
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F left)

    ;; clear places: only the top-of-stack A and the empty pegs (middle, right)
    (clear A)
    (clear middle)
    (clear right)

    ;; size ordering: A < B < C < D < E < F (all strict pairs)
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F)
    (smaller C D) (smaller C E) (smaller C F)
    (smaller D E) (smaller D F)
    (smaller E F)
  )

  (:goal (and
    ;; All disks stacked on right peg in same order top-to-bottom A B C D E F
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F right)

    ;; left and middle pegs must be empty (no disk directly on them)
    (clear left)
    (clear middle)
  ))
)