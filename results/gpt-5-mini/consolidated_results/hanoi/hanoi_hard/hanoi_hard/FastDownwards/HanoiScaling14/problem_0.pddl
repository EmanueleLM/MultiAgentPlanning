(define (problem hanoi-6)
  (:domain hanoi)
  (:objects
    A B C D E F - disk
    left middle right - peg
  )

  (:init
    ;; size ordering: A smallest, F largest
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F)
    (smaller C D) (smaller C E) (smaller C F)
    (smaller D E) (smaller D F)
    (smaller E F)

    ;; initial stacking on the middle peg: top->bottom A B C D E F
    (on-disk A B)
    (on-disk B C)
    (on-disk C D)
    (on-disk D E)
    (on-disk E F)
    (on-peg  F middle)

    ;; top facts: A is the current top of middle
    (top A middle)

    ;; pegs left and right are empty initially
    (empty left)
    (empty right)
    ;; middle is not empty (no (empty middle) fact)
  )

  (:goal
    (and
      ;; final stacking on left peg: top->bottom A B C D E F
      (on-disk A B)
      (on-disk B C)
      (on-disk C D)
      (on-disk D E)
      (on-disk E F)
      (on-peg  F left)

      ;; auxiliary peg constraints: middle and right must be empty
      (empty middle)
      (empty right)
    )
  )
)