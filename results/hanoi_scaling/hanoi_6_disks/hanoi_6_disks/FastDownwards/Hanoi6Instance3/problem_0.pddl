(define (problem hanoi-6)
  (:domain hanoi)
  (:objects
    A B C D E F - disk
    left middle right - peg
  )

  (:init
    ; initial stacking on the left peg, largest F at bottom, smallest A on top
    (on F left)
    (on E F)
    (on D E)
    (on C D)
    (on B C)
    (on A B)

    ; clear (top) facts: top disk A is clear; middle and right pegs are empty (clear)
    (clear A)
    (clear middle)
    (clear right)

    ; size order facts: A < B < C < D < E < F
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F)
    (smaller C D) (smaller C E) (smaller C F)
    (smaller D E) (smaller D F)
    (smaller E F)
  )

  ; Goal: all disks moved to the right peg in correct order (F bottom ... A top)
  (:goal (and
    (on F right)
    (on E F)
    (on D E)
    (on C D)
    (on B C)
    (on A B)
  ))
)