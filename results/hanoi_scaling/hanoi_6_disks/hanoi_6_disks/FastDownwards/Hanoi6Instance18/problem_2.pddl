(define (problem hanoi-6)
  (:domain hanoi)
  (:objects
    A B C D E F - disk
    left middle right - peg
  )
  (:init
    ;; Initial stack on left: top-to-bottom A, B, C, D, E, F
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F left)

    ;; Initially top disk A is clear; pegs middle and right are empty (clear)
    (clear A)
    (clear middle)
    (clear right)

    ;; Size (static) relations: A smallest, F largest
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F)
    (smaller C D) (smaller C E) (smaller C F)
    (smaller D E) (smaller D F)
    (smaller E F)
  )

  ;; Goal: entire stack moved to right peg (top-to-bottom A,B,C,D,E,F),
  ;; and left and middle pegs empty (clear).
  (:goal (and
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F right)
    (clear left)
    (clear middle)
  ))
)