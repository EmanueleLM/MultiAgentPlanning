(define (problem Hanoi7Instance12)
  (:domain hanoi7)
  (:objects
    A B C D E F G - disk
    left middle right - peg
  )
  (:init
    ;; initial direct-on relations (top->bottom A..G on left peg)
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F G)
    (on G left)

    ;; only the top disk is clear
    (clear A)

    ;; empty pegs
    (empty middle)
    (empty right)

    ;; size ordering: A < B < C < D < E < F < G (all strict pairs)
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G)
    (smaller C D) (smaller C E) (smaller C F) (smaller C G)
    (smaller D E) (smaller D F) (smaller D G)
    (smaller E F) (smaller E G)
    (smaller F G)
  )
  (:goal (and
    ;; goal stack on right: top->bottom A..G
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F G)
    (on G right)

    ;; other pegs empty
    (empty left)
    (empty middle)
  ))
)