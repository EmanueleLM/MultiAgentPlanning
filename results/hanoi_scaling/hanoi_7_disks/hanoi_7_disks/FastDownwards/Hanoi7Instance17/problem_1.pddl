(define (problem Hanoi7Instance17)
  (:domain hanoi)
  (:objects
    A B C D E F G - disk
    left middle right - peg
  )

  (:init
    ; initial stack on left: A (top) on B on C on D on E on F on G (bottom on peg left)
    (on-peg G left)      ; bottom disk G directly on peg left
    (on-disk F G)
    (on-disk E F)
    (on-disk D E)
    (on-disk C D)
    (on-disk B C)
    (on-disk A B)

    ; only the top disk A is clear initially
    (clear-disk A)
    ; disks B..G are not clear initially (implicitly by absence of clear-disk)
    ; middle and right pegs are empty initially
    (clear-peg middle)
    (clear-peg right)

    ; size ordering (strict): A < B < C < D < E < F < G
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G)
    (smaller C D) (smaller C E) (smaller C F) (smaller C G)
    (smaller D E) (smaller D F) (smaller D G)
    (smaller E F) (smaller E G)
    (smaller F G)
  )

  (:goal (and
    ; full tower moved to right peg preserving order: A on B ... on G on right
    (on-peg G right)
    (on-disk F G)
    (on-disk E F)
    (on-disk D E)
    (on-disk C D)
    (on-disk B C)
    (on-disk A B)
  ))
)