(define (problem hanoi-8-instance3)
  (:domain hanoi-8)
  (:objects
    A B C D E F G H - disk
    left middle right - peg
  )

  (:init
    ;; Initial stack on left: top->bottom A,B,C,D,E,F,G,H
    ;; Represented as A on B, B on C, ..., G on H, H on peg left
    (on-disk A B)
    (on-disk B C)
    (on-disk C D)
    (on-disk D E)
    (on-disk E F)
    (on-disk F G)
    (on-disk G H)
    (on-peg H left)

    ;; Clearness: only the top disk A is clear; left peg is occupied; middle and right are clear
    (clear-disk A)
    (clear-peg middle)
    (clear-peg right)

    ;; Size relations: strictly smaller pairs (A is smallest, H largest)
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G) (smaller A H)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G) (smaller B H)
    (smaller C D) (smaller C E) (smaller C F) (smaller C G) (smaller C H)
    (smaller D E) (smaller D F) (smaller D G) (smaller D H)
    (smaller E F) (smaller E G) (smaller E H)
    (smaller F G) (smaller F H)
    (smaller G H)
  )

  (:goal (and
    ;; Goal: all disks stacked on right: top->bottom A,B,C,D,E,F,G,H
    (on-disk A B)
    (on-disk B C)
    (on-disk C D)
    (on-disk D E)
    (on-disk E F)
    (on-disk F G)
    (on-disk G H)
    (on-peg H right)

    ;; Left and middle pegs empty; top disk on right (A) is clear
    (clear-peg left)
    (clear-peg middle)
    (clear-disk A)
  ))
)