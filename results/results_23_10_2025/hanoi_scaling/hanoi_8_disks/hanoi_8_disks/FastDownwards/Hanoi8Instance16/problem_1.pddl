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

    ;; only the topmost disk A is clear initially
    (clear A)
    ;; middle and right pegs are empty (clear)
    (clear middle)
    (clear right)

    ;; size ordering: A < B < C < D < E < F < G < H (encode all strict pairs)
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G) (smaller A H)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G) (smaller B H)
    (smaller C D) (smaller C E) (smaller C F) (smaller C G) (smaller C H)
    (smaller D E) (smaller D F) (smaller D G) (smaller D H)
    (smaller E F) (smaller E G) (smaller E H)
    (smaller F G) (smaller F H)
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