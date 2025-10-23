(define (problem Hanoi7Instance19)
  (:domain hanoi-7)
  (:objects
    A B C D E F G - disk
    left middle right - peg
  )
  (:init
    ;; Initial stack on left peg: top A on B on C on D on E on F on G; G is directly on left peg
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F G)
    (on G left)

    ;; Topness / emptiness facts
    (clear A)
    (clear middle)
    (clear right)

    ;; Size ordering: A < B < C < D < E < F < G (explicit pairwise smaller relations)
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G)
    (smaller C D) (smaller C E) (smaller C F) (smaller C G)
    (smaller D E) (smaller D F) (smaller D G)
    (smaller E F) (smaller E G)
    (smaller F G)
  )

  (:goal
    (and
      ;; Goal stack on right peg: top A on B on C on D on E on F on G (G directly on right)
      (on A B)
      (on B C)
      (on C D)
      (on D E)
      (on E F)
      (on F G)
      (on G right)
    )
  )
)