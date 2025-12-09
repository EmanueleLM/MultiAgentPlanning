(define (problem hanoi-6-right-to-left)
  (:domain hanoi-domain)
  (:objects
    A B C D E F - disk
    left middle right - peg
  )
  (:init
    ;; initial stacking on the right peg: F bottom, then E, D, C, B, A top
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F right)

    ;; clear facts: only the top disk A is clear; left and middle pegs are empty (clear)
    (clear A)
    (clear left)
    (clear middle)

    ;; size order facts: A < B < C < D < E < F
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F)
    (smaller C D) (smaller C E) (smaller C F)
    (smaller D E) (smaller D F)
    (smaller E F)
  )

  (:goal (and
    ;; all disks stacked on left peg in correct order: F on left, E on F, ..., A on B
    (on F left)
    (on E F)
    (on D E)
    (on C D)
    (on B C)
    (on A B)

    ;; middle and right pegs must be empty (explicitly required)
    (clear middle)
    (clear right)
  ))
)