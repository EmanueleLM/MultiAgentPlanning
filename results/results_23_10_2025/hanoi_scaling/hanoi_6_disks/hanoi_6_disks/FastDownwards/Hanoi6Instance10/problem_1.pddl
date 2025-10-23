(define (problem hanoi-6)
  (:domain hanoi)
  (:objects
    A B C D E F - disk
    left middle right - peg
  )
  (:init
    ;; Initial stack on left peg (top -> bottom): A, B, C, D, E, F
    (on-disk A B)
    (on-disk B C)
    (on-disk C D)
    (on-disk D E)
    (on-disk E F)
    (on-peg F left)

    ;; Topness / emptiness
    (clear-disk A)
    (clear-peg middle)
    (clear-peg right)

    ;; Size ordering (static): A < B < C < D < E < F
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F)
    (smaller C D) (smaller C E) (smaller C F)
    (smaller D E) (smaller D F)
    (smaller E F)
  )

  (:goal (and
    ;; Right peg must have full stack (top -> bottom): A, B, C, D, E, F
    (on-disk A B)
    (on-disk B C)
    (on-disk C D)
    (on-disk D E)
    (on-disk E F)
    (on-peg F right)

    ;; Other pegs empty
    (clear-peg left)
    (clear-peg middle)
  ))
)