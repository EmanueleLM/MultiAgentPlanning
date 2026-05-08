(define (problem hanoi-7-mover)
  (:domain hanoi-mover)

  (:objects
    A B C D E F G - disk
    left middle right - peg
  )

  (:init
    ;; initial stack on middle peg: from top to bottom A B C D E F G
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F G)
    (on G middle)

    ;; top disk is A, left and right pegs empty
    (clear A)
    (empty left)
    (empty right)

    ;; size ordering (only listed once per unordered pair)
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G)
    (smaller C D) (smaller C E) (smaller C F) (smaller C G)
    (smaller D E) (smaller D F) (smaller D G)
    (smaller E F) (smaller E G)
    (smaller F G)
  )

  (:goal (and
    ;; all disks stacked on right peg from top to bottom A B C D E F G
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F G)
    (on G right)
    (clear A)

    ;; left and middle pegs empty at the end
    (empty left)
    (empty middle)
  ))
)