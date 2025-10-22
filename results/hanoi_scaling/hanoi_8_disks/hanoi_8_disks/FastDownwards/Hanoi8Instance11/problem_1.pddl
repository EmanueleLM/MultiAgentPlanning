(define (problem hanoi-3pegs-8disks)
  (:domain hanoi)
  (:objects
    A B C D E F G H - disk
    left middle right - peg
  )

  (:init
    ;; initial physical stacking: top -> bottom A B C D E F G H on left
    (on-disk A B)
    (on-disk B C)
    (on-disk C D)
    (on-disk D E)
    (on-disk E F)
    (on-disk F G)
    (on-disk G H)
    (on-peg  H left)

    ;; every disk belongs to left peg initially
    (at A left) (at B left) (at C left) (at D left)
    (at E left) (at F left) (at G left) (at H left)

    ;; only the top disk is clear initially
    (clear A)

    ;; other disks are not clear by omission; only A is clear

    ;; peg emptiness flags
    (empty middle)
    (empty right)
    ;; left is non-empty initially (absence of (empty left))

    ;; size ordering (smaller X Y when X is strictly smaller than Y)
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G) (smaller A H)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G) (smaller B H)
    (smaller C D) (smaller C E) (smaller C F) (smaller C G) (smaller C H)
    (smaller D E) (smaller D F) (smaller D G) (smaller D H)
    (smaller E F) (smaller E G) (smaller E H)
    (smaller F G) (smaller F H)
    (smaller G H)
  )

  (:goal (and
    ;; final target stack top->bottom A..H on right
    (on-disk A B)
    (on-disk B C)
    (on-disk C D)
    (on-disk D E)
    (on-disk E F)
    (on-disk F G)
    (on-disk G H)
    (on-peg  H right)

    ;; all disks belong to right peg
    (at A right) (at B right) (at C right) (at D right)
    (at E right) (at F right) (at G right) (at H right)

    ;; ensure left and middle pegs are empty
    (empty left)
    (empty middle)
  ))
)