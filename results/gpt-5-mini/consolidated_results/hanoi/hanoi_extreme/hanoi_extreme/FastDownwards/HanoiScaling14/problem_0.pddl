(define (problem hanoi7-problem)
  (:domain hanoi7)

  (:objects
    A B C D E F G - disk
    left middle right - peg
  )

  (:init
    ;; initial direct-support (top->bottom): A on B on C on D on E on F on G on middle
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F G)
    (on G middle)

    ;; clear facts at start: top disk A and the empty pegs left and right
    (clear A)
    (clear left)
    (clear right)

    ;; static size ordering (A < B < C < D < E < F < G)
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G)
    (smaller C D) (smaller C E) (smaller C F) (smaller C G)
    (smaller D E) (smaller D F) (smaller D G)
    (smaller E F) (smaller E G)
    (smaller F G)
  )

  ;; Goal: complete stack A..G on left in same order and both other pegs empty
  (:goal (and
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F G)
    (on G left)
    (clear middle)
    (clear right)
  ))
)