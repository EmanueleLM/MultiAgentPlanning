(define (problem Hanoi7Instance2) 
  (:domain hanoi7)
  (:objects
    A B C D E F G - disk
    left middle right - peg
  )
  (:init
    ;; initial stack on left peg: bottom G on peg, F on G, ..., A on B (A is smallest)
    (on-peg G left)
    (on-disk F G)
    (on-disk E F)
    (on-disk D E)
    (on-disk C D)
    (on-disk B C)
    (on-disk A B)

    ;; top disk is clear
    (clear A)

    ;; the disk directly under A is not clear initially (closed-world): we do not assert clear B..G

    ;; middle and right pegs start empty; left peg is not empty (so no (empty left) fact)
    (empty middle)
    (empty right)

    ;; size ordering (A < B < C < D < E < F < G)
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G)
    (smaller C D) (smaller C E) (smaller C F) (smaller C G)
    (smaller D E) (smaller D F) (smaller D G)
    (smaller E F) (smaller E G)
    (smaller F G)
  )

  (:goal (and
    ;; target stack on right peg: bottom G on peg, F on G, ..., A on B
    (on-peg G right)
    (on-disk F G)
    (on-disk E F)
    (on-disk D E)
    (on-disk C D)
    (on-disk B C)
    (on-disk A B)
  ))
)