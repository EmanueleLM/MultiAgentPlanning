(define (problem hanoi6-instance3)
  (:domain hanoi6)
  (:objects
    A B C D E F - disk
    left middle right - peg
  )

  (:init
    ;; stacking: top->bottom A B C D E F on left peg
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F left)

    ;; clear things: top disk A is clear; middle and right pegs are empty (clear)
    (clear A)
    (clear middle)
    (clear right)

    ;; size order facts (A smallest, F largest)
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F)
    (smaller C D) (smaller C E) (smaller C F)
    (smaller D E) (smaller D F)
    (smaller E F)
  )

  ;; Goal: all disks stacked on right peg in same order (top A ... bottom F)
  (:goal (and
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F right)
  ))
)