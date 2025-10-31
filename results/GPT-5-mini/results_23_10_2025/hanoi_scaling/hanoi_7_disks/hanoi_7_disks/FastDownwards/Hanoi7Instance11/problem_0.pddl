(define (problem hanoi-7)
  (:domain hanoi)
  (:objects
    A B C D E F G - disk
    left middle right - peg
  )
  (:init
    ;; initial stack on left: top A, then B, C, D, E, F, bottom G on peg 'left'
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F G)
    (on G left)

    ;; clear places (nothing on top)
    (clear A)
    (clear middle)
    (clear right)

    ;; size (smaller) relations: A < B < C < D < E < F < G
    ;; all strict pairs where first is smaller than second
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G)
    (smaller C D) (smaller C E) (smaller C F) (smaller C G)
    (smaller D E) (smaller D F) (smaller D G)
    (smaller E F) (smaller E G)
    (smaller F G)
  )
  (:goal
    (and
      ;; goal stack on right: top A, then B, C, D, E, F, bottom G on peg 'right'
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