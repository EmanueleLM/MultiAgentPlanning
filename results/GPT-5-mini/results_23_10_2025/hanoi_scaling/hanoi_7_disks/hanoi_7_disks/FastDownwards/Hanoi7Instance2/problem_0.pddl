(define (problem hanoi-7)
  (:domain hanoi)
  (:objects
    A B C D E F G - disk
    left mid right - peg
  )
  (:init
    ;; initial tower on left peg: bottom G, then F on G, ..., A on B (A is smallest, G largest)
    (on-peg G left)
    (on-disk F G)
    (on-disk E F)
    (on-disk D E)
    (on-disk C D)
    (on-disk B C)
    (on-disk A B)

    ;; top disk is clear; other disks are implicitly not clear (closed-world)
    (clear A)

    ;; middle and right pegs start empty, left is not empty (so no (empty left) fact)
    (empty mid)
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
    ;; entire tower moved to right peg with same ordering: G bottom on peg, then F on G, ..., A on B
    (on-peg G right)
    (on-disk F G)
    (on-disk E F)
    (on-disk D E)
    (on-disk C D)
    (on-disk B C)
    (on-disk A B)
  ))
)