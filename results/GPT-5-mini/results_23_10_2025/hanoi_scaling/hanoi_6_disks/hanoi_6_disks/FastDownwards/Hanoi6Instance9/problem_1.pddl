(define (problem hanoi6-instance9)
  (:domain hanoi-6)
  (:objects
    A B C D E F - disk
    left middle right - peg
  )

  (:init
    ;; size ordering (A smallest, F largest)
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F)
    (smaller C D) (smaller C E) (smaller C F)
    (smaller D E) (smaller D F)
    (smaller E F)

    ;; initial stacked configuration on the left peg (top -> bottom: A B C D E F)
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F left)

    ;; initially clear places: the top disk A and the two empty pegs
    (clear A)
    (clear middle)
    (clear right)
  )

  (:goal
    (and
      ;; goal: entire stack moved to right peg preserving ordering (top->bottom A B C D E F)
      (on A B)
      (on B C)
      (on C D)
      (on D E)
      (on E F)
      (on F right)
    )
  )
)