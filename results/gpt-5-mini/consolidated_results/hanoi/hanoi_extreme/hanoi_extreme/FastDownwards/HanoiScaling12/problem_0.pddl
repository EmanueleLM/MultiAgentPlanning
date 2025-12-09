(define (problem hanoi7-problem)
  (:domain hanoi7)

  (:objects
    A B C D E F G - disk
    left middle right - peg
  )

  (:init
    ;; initial stack on the right peg: bottom G, then F,..., top A
    (on-peg G right)
    (on F G)
    (on E F)
    (on D E)
    (on C D)
    (on B C)
    (on A B)

    ;; bookkeeping: top disk on the right peg is A; left and middle are empty
    (top A right)
    (empty left)
    (empty middle)

    ;; static size ordering (A < B < C < D < E < F < G)
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G)
    (smaller C D) (smaller C E) (smaller C F) (smaller C G)
    (smaller D E) (smaller D F) (smaller D G)
    (smaller E F) (smaller E G)
    (smaller F G)
  )

  (:goal (and
    ;; full stack on left peg: bottom G ... top A
    (on-peg G left)
    (on F G)
    (on E F)
    (on D E)
    (on C D)
    (on B C)
    (on A B)

    ;; bookkeeping: top A on left; other pegs must be empty
    (top A left)
    (empty middle)
    (empty right)
  ))
)