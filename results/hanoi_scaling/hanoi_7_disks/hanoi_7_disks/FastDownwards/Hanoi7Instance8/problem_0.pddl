(define (problem hanoi7) (:domain hanoi)
  (:objects
    A B C D E F G    ;; disks, A smallest ... G largest
    left middle right ;; pegs
  )

  (:init
    ;; initial stack on left: top-to-bottom A, B, C, D, E, F, G
    (on A left)
    (on B A)
    (on C B)
    (on D C)
    (on E D)
    (on F E)
    (on G F)

    ;; clear facts: top disk A is clear; middle and right pegs are empty (clear)
    (clear A)
    (clear middle)
    (clear right)

    ;; size ordering facts (strict): smaller X Y if X is strictly smaller than Y
    ;; A < B,C,D,E,F,G
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G)
    ;; B < C,D,E,F,G
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G)
    ;; C < D,E,F,G
    (smaller C D) (smaller C E) (smaller C F) (smaller C G)
    ;; D < E,F,G
    (smaller D E) (smaller D F) (smaller D G)
    ;; E < F,G
    (smaller E F) (smaller E G)
    ;; F < G
    (smaller F G)
  )

  (:goal (and
    ;; goal stack on right: top-to-bottom A, B, C, D, E, F, G
    (on A right)
    (on B A)
    (on C B)
    (on D C)
    (on E D)
    (on F E)
    (on G F)
    ;; left and middle pegs must be empty
    (clear left)
    (clear middle)
  ))
)