(define (problem hanoi-7)
  (:domain hanoi)
  (:objects
    A B C D E F G - disk
    L M R - peg
  )
  (:init
    ;; Initial stack on left peg: top->bottom A B C D E F G
    ;; Using convention: (on X Y) means X is directly on support Y (support may be a disk or a peg)
    ;; So top A is on B, B on C, ..., F on G, G on peg L.
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F G)
    (on G L)

    ;; Size ordering: A < B < C < D < E < F < G
    ;; We list all strict pairs where left is smaller than right.
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G)
    (smaller C D) (smaller C E) (smaller C F) (smaller C G)
    (smaller D E) (smaller D F) (smaller D G)
    (smaller E F) (smaller E G)
    (smaller F G)
  )

  (:goal
    (and
      ;; Goal stack on right peg: top->bottom A B C D E F G
      (on A B)
      (on B C)
      (on C D)
      (on D E)
      (on E F)
      (on F G)
      (on G R)

      ;; Left and middle pegs must be empty (hard constraints).
      ;; Explicitly state there is no disk directly on L or M by listing negatives.
      (not (on A L)) (not (on B L)) (not (on C L)) (not (on D L)) (not (on E L)) (not (on F L)) (not (on G L))
      (not (on A M)) (not (on B M)) (not (on C M)) (not (on D M)) (not (on E M)) (not (on F M)) (not (on G M))
    )
  )
)