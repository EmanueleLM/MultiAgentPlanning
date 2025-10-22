(define (problem hanoi7instance8-problem) (:domain hanoi7instance8)
  (:objects
    A B C D E F G
    left middle right
  )

  (:init
    ;; type membership
    (disk A) (disk B) (disk C) (disk D) (disk E) (disk F) (disk G)
    (peg left) (peg middle) (peg right)

    ;; initial stack (top-to-bottom A,B,C,D,E,F,G) represented as on <upper> <below>
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F G)
    (on G left)

    ;; clear facts: only the top disk A is clear; middle and right pegs empty
    (clear A)
    (clear middle)
    (clear right)

    ;; size ordering facts (strict): smaller X Y if X is strictly smaller than Y
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G)
    (smaller C D) (smaller C E) (smaller C F) (smaller C G)
    (smaller D E) (smaller D F) (smaller D G)
    (smaller E F) (smaller E G)
    (smaller F G)
  )

  (:goal (and
    ;; goal stack on right: top-to-bottom A, B, C, D, E, F, G
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F G)
    (on G right)
    ;; left and middle pegs must be empty (clear)
    (clear left)
    (clear middle)
  ))
)