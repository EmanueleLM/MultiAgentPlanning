(define (problem hanoi-8)
  (:domain hanoi)
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

    ;; Clearness: only the top disk (A) is clear; left peg is occupied; middle and right empty
    (clear-disk A)
    (clear-peg middle)
    (clear-peg right)

    ;; Size relations: strictly smaller pairs (A is smallest, H largest)
    ;; A smaller than B..H
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G) (smaller A H)
    ;; B smaller than C..H
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G) (smaller B H)
    ;; C smaller than D..H
    (smaller C D) (smaller C E) (smaller C F) (smaller C G) (smaller C H)
    ;; D smaller than E..H
    (smaller D E) (smaller D F) (smaller D G) (smaller D H)
    ;; E smaller than F..H
    (smaller E F) (smaller E G) (smaller E H)
    ;; F smaller than G..H
    (smaller F G) (smaller F H)
    ;; G smaller than H
    (smaller G H)
  )

  (:goal (and
    ;; Goal: all disks stacked on right peg in same top->bottom order A..H
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