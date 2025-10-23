(define (problem hanoi-6)
  (:domain hanoi)

  (:objects
    A B C D E F - disk
    left middle right - peg
  )

  (:init
    ;; initial stack on left: top -> bottom A, B, C, D, E, F
    (on A left)
    (on B A)
    (on C B)
    (on D C)
    (on E D)
    (on F E)

    ;; initially the only clear/top elements are A (top disk), and empty pegs middle and right
    (clear A)
    (clear middle)
    (clear right)

    ;; disk size ordering (A smallest, F largest) - all strictly smaller pairs
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F)
    (smaller C D) (smaller C E) (smaller C F)
    (smaller D E) (smaller D F)
    (smaller E F)
  )

  (:goal (and
    ;; final stack on right: top -> bottom A, B, C, D, E, F
    (on A right)
    (on B A)
    (on C B)
    (on D C)
    (on E D)
    (on F E)
    ;; left and middle must be empty (no disk directly on those pegs)
    (clear left)
    (clear middle)
  ))
)