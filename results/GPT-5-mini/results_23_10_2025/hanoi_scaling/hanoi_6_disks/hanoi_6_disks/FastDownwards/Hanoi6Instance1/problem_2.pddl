(define (problem hanoi-6)
  (:domain hanoi)

  (:objects
    A B C D E F - disk
    left middle right - peg
  )

  (:init
    ;; initial stack on left: top -> bottom A, B, C, D, E, F
    (on F left)
    (on E F)
    (on D E)
    (on C D)
    (on B C)
    (on A B)

    ;; initially the only clear/top disk is A, and empty pegs middle and right
    (clear A)
    (clear middle)
    (clear right)

    ;; size ordering (A smallest, F largest)
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F)
    (smaller C D) (smaller C E) (smaller C F)
    (smaller D E) (smaller D F)
    (smaller E F)
  )

  (:goal (and
    ;; final stack on right: top -> bottom A, B, C, D, E, F
    (on F right)
    (on E F)
    (on D E)
    (on C D)
    (on B C)
    (on A B)
    ;; left and middle empty
    (clear left)
    (clear middle)
  ))
)