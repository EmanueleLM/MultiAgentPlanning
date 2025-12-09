(define (problem hanoi-7)
  (:domain hanoi)
  (:objects
    A B C D E F G - disk
    left middle right - peg
  )

  (:init
    ; type facts (optional since typing already declares objects, but included for clarity)
    (disk A) (disk B) (disk C) (disk D) (disk E) (disk F) (disk G)
    (peg left) (peg middle) (peg right)

    ; size ordering (static)
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G)
    (smaller C D) (smaller C E) (smaller C F) (smaller C G)
    (smaller D E) (smaller D F) (smaller D G)
    (smaller E F) (smaller E G)
    (smaller F G)

    ; initial stacks on right peg, top-to-bottom: A, B, C, D, E, F, G
    (on A right)
    (on B A)
    (on C B)
    (on D C)
    (on E D)
    (on F E)
    (on G F)

    ; top/empty maintained fluents
    (top A right)
    (empty left)
    (empty middle)
    ; Note: empty right is intentionally not asserted (right is not empty)

  )

  ; Goal: move all disks to middle peg with same stack order (A top ... G bottom),
  ; and ensure left peg is empty at the end (explicit hard constraint).
  (:goal (and
    (on A middle)
    (on B A)
    (on C B)
    (on D C)
    (on E D)
    (on F E)
    (on G F)
    (top A middle)
    (empty left)
  ))

)