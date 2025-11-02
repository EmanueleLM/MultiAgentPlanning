(define (problem hanoi-8)
  (:domain hanoi)
  (:objects
    A B C D E F G H - disk
    left middle right - peg
  )
  (:init
    ; Initial stack on left peg: bottom H on left, then G on H, ..., top A on B
    (on H left)
    (on G H)
    (on F G)
    (on E F)
    (on D E)
    (on C D)
    (on B C)
    (on A B)

    ; Only the top disk A and empty pegs (middle, right) are clear initially
    (clear A)
    (clear middle)
    (clear right)

    ; Size ordering (smaller relations) - A smallest, H largest
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G) (smaller A H)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G) (smaller B H)
    (smaller C D) (smaller C E) (smaller C F) (smaller C G) (smaller C H)
    (smaller D E) (smaller D F) (smaller D G) (smaller D H)
    (smaller E F) (smaller E G) (smaller E H)
    (smaller F G) (smaller F H)
    (smaller G H)
  )
  (:goal (and
    ; Goal: move the entire stack to the right peg preserving order
    (on H right)
    (on G H)
    (on F G)
    (on E F)
    (on D E)
    (on C D)
    (on B C)
    (on A B)
  ))
)