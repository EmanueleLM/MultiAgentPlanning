(define (problem hanoi-8)
  (:domain hanoi)
  (:objects
    A B C D E F G H - disk
    left middle right - peg
  )

  (:init
    ;; stack on left: top->bottom A B C D E F G H
    (on-disk A B)
    (on-disk B C)
    (on-disk C D)
    (on-disk D E)
    (on-disk E F)
    (on-disk F G)
    (on-disk G H)
    (on-peg H left)

    ;; topmost disk is A
    (clear-disk A)

    ;; other disks initially have something on top (so no clear-disk facts for them)

    ;; middle and right pegs are empty
    (clear-peg middle)
    (clear-peg right)

    ;; size ordering (A smallest, H largest)
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G) (smaller A H)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G) (smaller B H)
    (smaller C D) (smaller C E) (smaller C F) (smaller C G) (smaller C H)
    (smaller D E) (smaller D F) (smaller D G) (smaller D H)
    (smaller E F) (smaller E G) (smaller E H)
    (smaller F G) (smaller F H)
    (smaller G H)
  )

  (:goal (and
    ;; all disks stacked on right peg in same order A (top) ... H (bottom)
    (on-disk A B)
    (on-disk B C)
    (on-disk C D)
    (on-disk D E)
    (on-disk E F)
    (on-disk F G)
    (on-disk G H)
    (on-peg H right)

    ;; left and middle pegs empty, top disk A clear
    (clear-peg left)
    (clear-peg middle)
    (clear-disk A)
  ))
)