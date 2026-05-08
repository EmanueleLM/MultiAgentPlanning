(define (problem hanoi-7-problem)
  (:domain hanoi-7)
  (:objects
    A B C D E F G - disk
    left middle right - peg
  )

  (:init
    ;; initial stack on middle: G on middle (bottom), then F on G, E on F, ..., A on B (top)
    (on G middle)
    (on F G)
    (on E F)
    (on D E)
    (on C D)
    (on B C)
    (on A B)

    ;; top-most disk is A
    (clear A)

    ;; pegs left and right are initially empty; middle is not empty (no empty fact)
    (empty left)
    (empty right)

    ;; size ordering: A smallest, G largest. Enumerate all smaller relations.
    ;; A smaller than B,C,D,E,F,G
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G)
    ;; B smaller than C,D,E,F,G
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G)
    ;; C smaller than D,E,F,G
    (smaller C D) (smaller C E) (smaller C F) (smaller C G)
    ;; D smaller than E,F,G
    (smaller D E) (smaller D F) (smaller D G)
    ;; E smaller than F,G
    (smaller E F) (smaller E G)
    ;; F smaller than G
    (smaller F G)
  )

  (:goal (and
    ;; final stack on left: G on left (bottom), then F on G, ..., A on B (top)
    (on G left)
    (on F G)
    (on E F)
    (on D E)
    (on C D)
    (on B C)
    (on A B)

    ;; other pegs must be empty
    (empty middle)
    (empty right)
  ))
)