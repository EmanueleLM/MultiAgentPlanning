(define (problem hanoi-7)
  (:domain tower-of-hanoi)
  (:objects
    A B C D E F G - disk
    left middle right - peg
  )
  (:init
    ;; initial stack on left: top-to-bottom A,B,C,D,E,F,G
    (on G left)
    (on F G)
    (on E F)
    (on D E)
    (on C D)
    (on B C)
    (on A B)

    ;; clear places (top elements)
    (clear A)
    (clear middle)
    (clear right)

    ;; size ordering: A smallest, G largest
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G)
    (smaller C D) (smaller C E) (smaller C F) (smaller C G)
    (smaller D E) (smaller D F) (smaller D G)
    (smaller E F) (smaller E G)
    (smaller F G)
  )

  (:goal (and
    ;; target stack on right: top-to-bottom A,B,C,D,E,F,G
    (on G right)
    (on F G)
    (on E F)
    (on D E)
    (on C D)
    (on B C)
    (on A B)
  ))
)