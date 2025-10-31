(define (problem hanoi-8)
  (:domain hanoi)
  (:objects
    A B C D E F G H - disk
    left middle right - peg
  )

  (:init
    ;; initial stacking on the left peg, top-to-bottom: A B C D E F G H
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F G)
    (on G H)
    (on H left)

    ;; clear places (nothing on top)
    (clear A)
    (clear middle)
    (clear right)

    ;; size ordering: A is smallest, H largest. Encode all strict pairs.
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
    ;; goal stacking on the right peg, top-to-bottom: A B C D E F G H
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F G)
    (on G H)
    (on H right)

    ;; left and middle pegs must be empty (clear)
    (clear left)
    (clear middle)

    ;; topmost disk A must be clear
    (clear A)
  ))
)