(define (problem hanoi-left-to-right-7)
  (:domain hanoi)
  (:objects
    A B C D E F G - disk
    left middle right - peg
  )

  (:init
    ;; Initial stack on left peg, top-to-bottom: A, B, C, D, E, F, G
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F G)
    (on G left)

    ;; Clear facts: only top disk A and empty pegs middle and right are clear initially
    (clear A)
    (clear middle)
    (clear right)

    ;; Size ordering: A smallest, G largest
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G)
    (smaller C D) (smaller C E) (smaller C F) (smaller C G)
    (smaller D E) (smaller D F) (smaller D G)
    (smaller E F) (smaller E G)
    (smaller F G)
  )

  (:goal (and
    ;; Goal: same order on right peg, top-to-bottom: A, B, C, D, E, F, G
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F G)
    (on G right)
  ))
)