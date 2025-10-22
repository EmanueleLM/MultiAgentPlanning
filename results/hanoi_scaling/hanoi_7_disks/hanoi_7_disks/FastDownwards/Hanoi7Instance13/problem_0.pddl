(define (problem hanoi-7)
  (:domain tower-of-hanoi)
  (:objects
    A B C D E F G - disk
    left middle right - peg
  )

  (:init
    ; Initial stack (top to bottom) A, B, C, D, E, F, G on the left peg
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F G)
    (on G left)

    ; Clear/top facts
    (clear A)        ; A is the top disk
    (clear middle)   ; middle peg is empty
    (clear right)    ; right peg is empty

    ; Disk size ordering (A smallest, G largest)
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G)
    (smaller C D) (smaller C E) (smaller C F) (smaller C G)
    (smaller D E) (smaller D F) (smaller D G)
    (smaller E F) (smaller E G)
    (smaller F G)
  )

  (:goal
    (and
      ; Goal stack (top to bottom) A, B, C, D, E, F, G on the right peg
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