(define (problem Hanoi7Instance1)
  (:domain hanoi7)
  (:objects
    A B C D E F G
  )

  (:init
    ;; immediate support chain (top->bottom): A on B, B on C, ..., F on G, G on left
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F G)
    (on G left)

    ;; whose top is clear
    (clear A)
    (clear middle)
    (clear right)

    ;; at-peg for each disk (all start on left)
    (at A left)
    (at B left)
    (at C left)
    (at D left)
    (at E left)
    (at F left)
    (at G left)

    ;; size ordering (smaller ...)
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G)
    (smaller C D) (smaller C E) (smaller C F) (smaller C G)
    (smaller D E) (smaller D F) (smaller D G)
    (smaller E F) (smaller E G)
    (smaller F G)
  )

  (:goal (and
    ;; desired final immediate-support chain on right (top->bottom)
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F G)
    (on G right)
    ;; pegs left and middle empty (no top disk)
    (clear left)
    (clear middle)
  ))
)