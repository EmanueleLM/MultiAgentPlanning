(define (problem hanoi-7-left-to-right)
  (:domain Tower_of_Hanoi)
  (:objects
    A B C D E F G - disk
    left middle right - peg
  )

  (:init
    ;; initial stacking on the left peg, top to bottom: A B C D E F G
    (on A left)
    (on B A)
    (on C B)
    (on D C)
    (on E D)
    (on F E)
    (on G F)

    ;; clear predicates: A is top of left, middle and right pegs are empty
    (clear A)
    (clear middle)
    (clear right)

    ;; static size ordering (A < B < C < D < E < F < G)
    ;; All ordered pairs where the first is strictly smaller than the second:
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G)
    (smaller C D) (smaller C E) (smaller C F) (smaller C G)
    (smaller D E) (smaller D F) (smaller D G)
    (smaller E F) (smaller E G)
    (smaller F G)
  )

  (:goal (and
    ;; target stacking on the right peg, top to bottom: A B C D E F G
    (on A right)
    (on B A)
    (on C B)
    (on D C)
    (on E D)
    (on F E)
    (on G F)

    ;; left and middle pegs must be empty (no disk directly on them)
    (clear left)
    (clear middle)
  ))
)