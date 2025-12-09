(define (problem hanoi7-problem)
  (:domain hanoi7)
  (:objects
    A B C D E F G - disk
    left middle right - peg
  )

  (:init
    ; initial immediate-support relations (top-to-bottom on right peg: A,B,C,D,E,F,G)
    (on-disk A B)
    (on-disk B C)
    (on-disk C D)
    (on-disk D E)
    (on-disk E F)
    (on-disk F G)
    (on-peg G right)

    ; top/clear status initial
    (top A right)
    (clear-disk A)
    (clear-peg left)
    (clear-peg middle)
    ; right peg is not clear (no explicit fact)

    ; static size ordering (A < B < C < D < E < F < G)
    ; A smaller than ...
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G)
    ; B smaller than ...
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G)
    ; C smaller than ...
    (smaller C D) (smaller C E) (smaller C F) (smaller C G)
    ; D smaller than ...
    (smaller D E) (smaller D F) (smaller D G)
    ; E smaller than ...
    (smaller E F) (smaller E G)
    ; F smaller than ...
    (smaller F G)
  )

  (:goal (and
    ; final ordered stack on left: top A, then B, C, D, E, F, G bottom
    (on-disk A B)
    (on-disk B C)
    (on-disk C D)
    (on-disk D E)
    (on-disk E F)
    (on-disk F G)
    (on-peg G left)
    (top A left)
    (clear-disk A)

    ; other pegs must be empty
    (clear-peg middle)
    (clear-peg right)
  ))
)